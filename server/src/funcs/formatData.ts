export function formatarData(dataString: any) {
  const [day, month, year] = dataString.split('/');
  return `${year}-${month}-${day}`;
}