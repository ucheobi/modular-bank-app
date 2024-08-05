FROM node:18.20.3

ENV NEXT_PUBLIC_SITE_URL=http://localhost:3000 \
    NEXT_PUBLIC_APPWRITE_ENDPOINT=https://cloud.appwrite.io/v1 \
    NEXT_PUBLIC_APPWRITE_PROJECT=669a2a3b00049b1735ee \
    APPWRITE_DATABASE_ID=669a4847003d72f8d55f \
    APPWRITE_USER_COLLECTION_ID=669a486c000b252f48da \
    APPWRITE_BANK_COLLECTION_ID=669a48fc00019b8b7072 \
    APPWRITE_TRANSACTION_COLLECTION_ID=669a48d60020d46b9569 \
    NEXT_APPWRITE_KEY=3b60683ef9b5fb184496cf93e05fd7fc7db1fdcfab75e1fd3fcd245a52b7dbfd958bd2c06fc08320384b7a43f080b5701ad2aec31fed84084ac9575df5f2527e1579f4e9a2ba8997c7f161ac019bd8a2808e5441c1de81f770d3b3eff1ac109fac482bc3506beaadba1f3ccc4cba9cfa09fd40275a74c6bc99550d83470a731f \
    PLAID_CLIENT_ID=669e54065e3c0b001a9ef5de \
    PLAID_SECRET=7ec5c1d494b4a29e66d729d3f728f0 \
    PLAID_ENV=sandbox \
    PLAID_PRODUCTS=auth,transaction,identity \
    PLAID_COUNTRY_CODES=US,CAe \
    DWOLLA_KEY=0N9jl0Kj0wpjK2n2lJxN4sePM9kudpfGQyIH3C7A3Kt4uz5GGI \
    DWOLLA_SECRET=YHgS39d5enokKSxeJ7srXFXszhU6ge8akWUyALAyvNVSKGvm5O \
    DWOLLA_BASE_URL=https://api-sandbox.dwolla.com \
    DWOLLA_ENV=sandbox


WORKDIR /app

COPY package*.json ./

RUN npm install

#RUN mkdir -p node_modules/.cache && chmod -R 777 node_modules/.cache

RUN mkdir -p /app/.next/cache && chown -R node:node /app

USER node

#COPY . .
COPY --chown=node:node . .

EXPOSE 3000

RUN npm run build

CMD npm run dev