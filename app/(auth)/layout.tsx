import Image from "next/image";

export default function RootLayout({
  children,
}: Readonly<{
  children: React.ReactNode;
}>) {
  return (
    <main className="flex min-h-screen w-full justify-between font-inter mt-4">
      {children}
      <div className="auth-asset">
        <div>
          <Image
            src="/icons/auth-image-2.png"
            alt="Auth Image"
            width={700}
            height={800}
          />
        </div>
      </div>
    </main>
  );
}

// "aliases": {
//     "components": "@/components",
//     "utils": "@/lib/utils"
//   }
