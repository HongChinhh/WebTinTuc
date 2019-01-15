using System;
using System.Security.Cryptography;
using System.Text;

namespace WebsiteAdmission.Common
{
    public class PasswordHash
    {
        public static string Encrypt(string password)
        {
            var provider = MD5.Create();
            byte[] bytes = provider.ComputeHash(Encoding.ASCII.GetBytes(password));
            return BitConverter.ToString(bytes);
        }
    }
}