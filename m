Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795730015;
	b=CX5w1osU1ShiaYaNLXGtgNVR+FgFe735zaqkCviot/3NrlPO/gACO4AZVPcD1uBZzLn9
	 QMHxDXwY5x0loyJdN3q9oQMI7aWWBnNEblDIRQAQ9sprbp5yWn5esc/V71c/OaKYLZV7Q
	 RiECuu5GdyeTOGyANHCOKq5i5YKLkTwaRPPZ1mqLEx5l3cOyfH0iUDL6RZAkGQjvJRG5Z
	 +KzvnKwqrE0Dt3VbRkRAK/biAmPeyNhRS3x7mF8b/nX1t7Bic8PMkSDLQmiIS7AmLYxAM
	 flq1Fi6fLZC2kkkP4PRfdap4fYqiXaGE8H9THBPglYaLUB33kMHLO+Zkd4D6uXpk0DQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795730015;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:Autocrypt:
	 Content-Type:User-Agent:MIME-Version;
	bh=env9OD6WJ5uGqN3vphpmLPvAyZWACc9jYsEiViZZwfI=;
	b=B1IlyiTAOigJ+nvVf0+AlX48vqCsau2vaATnBVqgGVJUmQtEp3soJ7KpEt9y104n2pad
	 5baYbZZ7r2gIOafhrsIflFj6lehDDGC1mvt7HW8ZROLOhoBZnS4EO2h6CQLDWf1NUasOz
	 ErxXhJg9r17LaHZ4WFZzrscWGgog4uOgjjkyUtw8HH4o4VuxeEqOpyp3tPPYS4swlhmBl
	 yNh4ntOVW+CaU/UrTchdbtWjbaK006zbDcB5GJmciYjTfuMAa41Px4PzZh2SRFaxu62Up
	 z4gZN8x/Y7dR4Qih268f9oE/qoVPOgkyipX+9B60tai6t6cSiHpsA3ZxyGNu4yq+Z/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ndufresne.ca;
	spf=pass smtp.mailfrom=ndufresne.ca;
	dkim=pass header.d=ndufresne-ca.20260707.gappssmtp.com header.i=@ndufresne-ca.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b="HuAe/wTW";
	arc=none smtp.remote-ip=209.85.222.180
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81D06606A31C
	for <linux-media@vger.kernel.org>; Thu, 26 Nov 2026 21:53:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 81D06606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20260707.gappssmtp.com header.i=@ndufresne-ca.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=HuAe/wTW
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-949b0d32315so607398285a.1
        for <linux-media@vger.kernel.org>; Thu, 26 Nov 2026 13:53:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20260707.gappssmtp.com; s=20260707; t=1795730014; x=1796334814; darn=vger.kernel.org;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=env9OD6WJ5uGqN3vphpmLPvAyZWACc9jYsEiViZZwfI=;
        b=HuAe/wTWSVBcTgkxqCs3FJVZTgk/EcI6TOIk/kQi88nOHPAz0IshwbNbEr9Us7ruS9
         oUhp8H+XFRHy66KiBCKv5x7c1t25JuGVrf/6gTpXoX/Q4yi8td24zb+qNt4vl+x8JF9j
         3TePrqRHUwd96jczTkAsWm2Sc2zluXhSr7i95q5wn4+m6CJ1OaMe3tfBOPWVU/GMp1/f
         yaqEplLMmytsHbZf9bChl1Te1JVAbwU1f6gs44bw89kfVDemUCWTSnBRBWgBxq4Dh9Vl
         vvCtLyecMfxLcxBGfFCNqqVrcDk7aLV2HDYFOUllwxc2aWPqsfEgKcRyr2ZFRNHT5WmC
         I5WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795730014; x=1796334814;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=env9OD6WJ5uGqN3vphpmLPvAyZWACc9jYsEiViZZwfI=;
        b=0FRMgU7AyCEESARtVcE+nbhwOZC286gVvih059C6CoBHJxVIIwirY0IVt1KZnARL9t
         EasbumiknvEGbFkHVlIWgxWHsvR2ld2KKWmq6fcqTd38Zm4l0JzRocVQbW85XSZu9GlL
         IC8iCCw2Wziv2iIDqmlfdDKvQkmY3j9iY6uWKwm7BDxjvO6dsdkf6FA3FSpRrsNlWIpU
         pkPqU2O70pZwITr9c1iLNZLyTlh2I70upw3aQPgyGoTC67spN62JqM7n3YKZsYzXb1ZG
         ogaXQ9DEN557+rAWywJshkWlU3+4SWL+9CDwFKD4Z8eTib5Bg09fTu385b0s4MnrG+v9
         AJKw==
X-Forwarded-Encrypted: i=1; AL+hErHmU7zCZNw4m4kPyQ5MIBPdfOujg2iZ/YDbP3CsuEWHXaEU5YnSbwAJQKpPxpKMGSe/2BeXdpqsiFKcdQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z83dxA9P29hmYBLBY3x4Oh4G6wKVoYmM2Fyf7NTCK5z8GGKCHi/
	yQ8EI+mBJz5Qfc0taCT+TG/SrXuLErjPjvZBPdpWb/92ylwq4C35iUGMpX+b+ET169w=
X-Gm-Gg: AZFdTZf6r/ZXzLLbhG08Mld2p8g2bengE5WQrDgFG3Lwgk2fE+KsJxo0UMxHQiEd0C1
	Tgvs5ccn1zPRjODTedpPEIKeFJf0il39jzwaZnnfoYib+FTHZ6qjDyuZIozWWpEAS6WrXsLAUNH
	LdU+LJDqWpFJFAbvol7fpISjjucmwbMdg8P2vhKz/d2KlJbDRdw9ddvTo6HxerdNnlXLB0P9afZ
	gtiUMX8+X2Jj/JIDougC7x7iukRzRUTCgDa+H1EkavK1n9QntdZh2AWX+2PO4SG+E0s08hmM4Sr
	szyRe454ohGmS1k0qwazTsEfcK5s4/xiFwLfwTCRB2LWd0DW9Yp6KEA5afG7aQsjMaxYHM7Ok7c
	TXUIihZ7Y6korTyd5z1VFNCOXpXOUHqGohY90GNJLrmY69wdfaz5oOGCcgEoHvy1rh0wVi7oLVU
	omgIe3xrxiGyIn+2anQ9/RhTIOFymPvuScU4AFj+xEsXPT2yLxMUg/JtsXk0+cA4ffHa7/u8iVf
	cu4mbLxutD3E6Ity2xsZSM7FK3WugMTWre6boQF9XVGbvpdxHYTBpjuE2FVfItqCrpk4ZwItHRj
	74Z7vcoLvuDabTStQZCP0A/Q+YJZYV1veRSiFm8x87fPRfuiz6Q1Uxg=
X-Received: by 2002:a05:620a:6011:b0:93c:c1e8:6504 with SMTP id af79cd13be357-949ba9555e2mr3721601785a.23.1795730014488;
        Thu, 26 Nov 2026 13:53:34 -0800 (PST)
Received: from ?IPv6:2606:6d00:11:8ec9::c41? ([2606:6d00:11:8ec9::c41])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949bb349db3sm1654907285a.7.2026.11.26.13.53.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 13:53:33 -0800 (PST)
Message-ID: <a7e72cdb67e7ab8578b9ce44a4817ba35d1f822b.camel@ndufresne.ca>
Subject: Re: [PATCH] media: mediatek: vcodec: NUL-terminate debugfs input
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Jiale Yao <yaojiale02@163.com>, Tiffany Lin <tiffany.lin@mediatek.com>, 
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Yunfei Dong
 <yunfei.dong@mediatek.com>, Mauro Carvalho Chehab	 <mchehab@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,  AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Hans Verkuil
 <hverkuil@kernel.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Cc: stable@vger.kernel.org
Date: Thu, 26 Nov 2026 16:53:32 -0500
In-Reply-To: <20261029053024.2526059-1-yaojiale02@163.com>
References: <20261029053024.2526059-1-yaojiale02@163.com>
Autocrypt: addr=nicolas@ndufresne.ca; prefer-encrypt=mutual;
 keydata=mDMEaCN2ixYJKwYBBAHaRw8BAQdAM0EHepTful3JOIzcPv6ekHOenE1u0vDG1gdHFrChD
 /e0J05pY29sYXMgRHVmcmVzbmUgPG5pY29sYXNAbmR1ZnJlc25lLmNhPoicBBMWCgBEAhsDBQsJCA
 cCAiICBhUKCQgLAgQWAgMBAh4HAheABQkJZfd1FiEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrjo
 CGQEACgkQ2UGUUSlgcvQlQwD/RjpU1SZYcKG6pnfnQ8ivgtTkGDRUJ8gP3fK7+XUjRNIA/iXfhXMN
 abIWxO2oCXKf3TdD7aQ4070KO6zSxIcxgNQFtDFOaWNvbGFzIER1ZnJlc25lIDxuaWNvbGFzLmR1Z
 nJlc25lQGNvbGxhYm9yYS5jb20+iJkEExYKAEECGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4
 AWIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaCyyxgUJCWX3dQAKCRDZQZRRKWBy9ARJAP96pFmLffZ
 smBUpkyVBfFAf+zq6BJt769R0al3kHvUKdgD9G7KAHuioxD2v6SX7idpIazjzx8b8rfzwTWyOQWHC
 AAS0LU5pY29sYXMgRHVmcmVzbmUgPG5pY29sYXMuZHVmcmVzbmVAZ21haWwuY29tPoiZBBMWCgBBF
 iEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrGYCGwMFCQll93UFCwkIBwICIgIGFQoJCAsCBBYCAw
 ECHgcCF4AACgkQ2UGUUSlgcvRObgD/YnQjfi4+L8f4fI7p1pPMTwRTcaRdy6aqkKEmKsCArzQBAK8
 bRLv9QjuqsE6oQZra/RB4widZPvphs78H0P6NmpIJ
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-DlJB1J9haeeqeVzf+bdm"
User-Agent: Evolution 3.62.1 (3.62.1-1.fc45) 
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

--=-DlJB1J9haeeqeVzf+bdm
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le jeudi 29 octobre 2026 =C3=A0 13:30 +0800, Jiale Yao a =C3=A9crit=C2=A0:
> mtk_vdec_dbgfs_write() allows userspace to overwrite every byte in the
> persistent debugfs buffer. The read handler later searches that buffer wi=
th
> strstr(), which can read past its end when no NUL remains.
>=20
> Reserve one byte and terminate the copied input at the updated file
> position before releasing the debugfs lock.
>=20
> Fixes: 5e488a4fd859 ("media: mediatek: vcodec: Add a debugfs file to get =
different useful information")
> Cc: stable@vger.kernel.org
> Signed-off-by: Jiale Yao <yaojiale02@163.com>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
>  .../media/platform/mediatek/vcodec/common/mtk_vcodec_dbgfs.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_dbg=
fs.c b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_dbgfs.c
> index 2da11521fc7b..8528534e41ef 100644
> --- a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_dbgfs.c
> +++ b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_dbgfs.c
> @@ -77,8 +77,11 @@ static ssize_t mtk_vdec_dbgfs_write(struct file *filp,=
 const char __user *ubuf,
>  =09struct mtk_vcodec_dbgfs *dbgfs =3D &vcodec_dev->dbgfs;
> =20
>  =09mutex_lock(&dbgfs->dbgfs_lock);
> -=09dbgfs->buf_size =3D simple_write_to_buffer(dbgfs->dbgfs_buf, sizeof(d=
bgfs->dbgfs_buf),
> +=09dbgfs->buf_size =3D simple_write_to_buffer(dbgfs->dbgfs_buf,
> +=09=09=09=09=09=09 sizeof(dbgfs->dbgfs_buf) - 1,
>  =09=09=09=09=09=09 ppos, ubuf, count);
> +=09if (dbgfs->buf_size > 0)
> +=09=09dbgfs->dbgfs_buf[*ppos] =3D '\0';
>  =09mutex_unlock(&dbgfs->dbgfs_lock);
>  =09if (dbgfs->buf_size > 0)
>  =09=09return count;

--=-DlJB1J9haeeqeVzf+bdm
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCawiqXAAKCRDZQZRRKWBy
9HvlAQC+KcPKwSaD7Ix8GCPtMRz0njYszGlIhj94VYNm0BjnnQEA8O7IpD79HTUk
JcUCeKPKDEyp+qT34NJFPS+wfxGcZwY=
=kTt2
-----END PGP SIGNATURE-----

--=-DlJB1J9haeeqeVzf+bdm--
