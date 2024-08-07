const validTokens = ['prisma-token']; 

export function isValidToken(token) {
  return validTokens.includes(token); 
}
