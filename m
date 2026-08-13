Received: from shelob.surriel.com (shelob.surriel.com [96.67.55.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D5212E7635;
	Thu, 13 Aug 2026 18:35:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=96.67.55.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786646116; cv=none; b=aR3PCUoKBawI0fUeAvgnNm23MIDOMwBXQSU99LZ5NnT+JziXBF7qe40cY7jXt/Y3PitQq+/oC5QhiMBbwho/E4m1rhQZquKpoH4Mjo8yvYl7gkE58UY+OrNYqlxYdIfFJnzHAUiRMsndzRJf8lCUIKsLL7t6ZcflZURKPkvXK7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786646116; c=relaxed/simple;
	bh=lsaYQMXuABX5DLnqF8opxhlbZJuTgcku6PpP7+RwlGY=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=e6P51KKeHcdYgMShgEOsDKZgZkTDkPUytrleBCKGIq2k7QW0XXvRf1xP7J+SszUXvzvPsK7+BuSIXnswE6W/FOQhunVt2sVReAFuRPx2dLJZ3LaWPBLMfnlGM0srrLh7qcclsatF7nU4/82CsMnH2eTw5REPfewspVTpG+sPm0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=surriel.com; spf=pass smtp.mailfrom=surriel.com; dkim=pass (2048-bit key) header.d=surriel.com header.i=@surriel.com header.b=ZHlnPIeE; arc=none smtp.client-ip=96.67.55.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=surriel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=surriel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=surriel.com header.i=@surriel.com header.b="ZHlnPIeE"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=surriel.com
	; s=mail; h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
	In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=lsaYQMXuABX5DLnqF8opxhlbZJuTgcku6PpP7+RwlGY=; b=ZHlnPIeEA+sl3WLZGyd141bpLi
	6qOmDnZV3jba9iVNLHw1n/FRbQ+LW3dZBnlZLbY0o9+s8OYZ5aW0wWv/JJLRHnZkVEDBrwR+unNQq
	wrU+Yk7AZPXKP19JPT1g4OA1kM3UxDYYjzovSqZSFcfvzPOS2RH+BFTO8zQz9POjQF9WWdEKbgg1S
	A1/fXtU3srUQOVfl03BI08kbjck3Ml1o0s1LH/CIyBeb/S46P2aXcnxS0HypXIuLtLiFcwQd231Tk
	9hUAVBUMjEl/Y3Bd3QfFBVnomFYMstMahtwibWU0H3PVlpbZXxFQkdiJiy1ZoZmrSjIkpG16cxNnF
	8EI8POAQ==;
Received: from [96.67.55.146]
	by shelob.surriel.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.5)
	(envelope-from <riel@surriel.com>)
	id 1wuaGS-000000001vW-1rT4;
	Thu, 13 Aug 2026 18:34:52 +0000
Message-ID: <fc39e12b113f2e03f1dd41afc48267874379b554.camel@surriel.com>
Subject: Re: [PATCH v2] media: redrat3: fix UAF in probe error path leaving
 rc device registered
From: Rik van Riel <riel@surriel.com>
To: Sean Young <sean@mess.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Jarod Wilson
 <jarod@redhat.com>, 	linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org
Date: Thu, 13 Aug 2026 14:34:52 -0400
In-Reply-To: <an3ObNj_uyRJI2tY@extorris.mess.org>
References: <20260808232031.500f781c@fangorn>
	 <an3ObNj_uyRJI2tY@extorris.mess.org>
Autocrypt: addr=riel@surriel.com; prefer-encrypt=mutual;
 keydata=mQENBFIt3aUBCADCK0LicyCYyMa0E1lodCDUBf6G+6C5UXKG1jEYwQu49cc/gUBTTk33A
 eo2hjn4JinVaPF3zfZprnKMEGGv4dHvEOCPWiNhlz5RtqH3SKJllq2dpeMS9RqbMvDA36rlJIIo47
 Z/nl6IA8MDhSqyqdnTY8z7LnQHqq16jAqwo7Ll9qALXz4yG1ZdSCmo80VPetBZZPw7WMjo+1hByv/
 lvdFnLfiQ52tayuuC1r9x2qZ/SYWd2M4p/f5CLmvG9UcnkbYFsKWz8bwOBWKg1PQcaYHLx06sHGdY
 dIDaeVvkIfMFwAprSo5EFU+aes2VB2ZjugOTbkkW2aPSWTRsBhPHhV6dABEBAAG0HlJpayB2YW4gU
 mllbCA8cmllbEByZWRoYXQuY29tPokBHwQwAQIACQUCW5LcVgIdIAAKCRDOed6ShMTeg05SB/986o
 gEgdq4byrtaBQKFg5LWfd8e+h+QzLOg/T8mSS3dJzFXe5JBOfvYg7Bj47xXi9I5sM+I9Lu9+1XVb/
 r2rGJrU1DwA09TnmyFtK76bgMF0sBEh1ECILYNQTEIemzNFwOWLZZlEhZFRJsZyX+mtEp/WQIygHV
 WjwuP69VJw+fPQvLOGn4j8W9QXuvhha7u1QJ7mYx4dLGHrZlHdwDsqpvWsW+3rsIqs1BBe5/Itz9o
 6y9gLNtQzwmSDioV8KhF85VmYInslhv5tUtMEppfdTLyX4SUKh8ftNIVmH9mXyRCZclSoa6IMd635
 Jq1Pj2/Lp64tOzSvN5Y9zaiCc5FucXtB9SaWsgdmFuIFJpZWwgPHJpZWxAc3VycmllbC5jb20+iQE
 +BBMBAgAoBQJSLd2lAhsjBQkSzAMABgsJCAcDAgYVCAIJCgsEFgIDAQIeAQIXgAAKCRDOed6ShMTe
 g4PpB/0ZivKYFt0LaB22ssWUrBoeNWCP1NY/lkq2QbPhR3agLB7ZXI97PF2z/5QD9Fuy/FD/jddPx
 KRTvFCtHcEzTOcFjBmf52uqgt3U40H9GM++0IM0yHusd9EzlaWsbp09vsAV2DwdqS69x9RPbvE/Ne
 fO5subhocH76okcF/aQiQ+oj2j6LJZGBJBVigOHg+4zyzdDgKM+jp0bvDI51KQ4XfxV593OhvkS3z
 3FPx0CE7l62WhWrieHyBblqvkTYgJ6dq4bsYpqxxGJOkQ47WpEUx6onH+rImWmPJbSYGhwBzTo0Mm
 G1Nb1qGPG+mTrSmJjDRxrwf1zjmYqQreWVSFEt26tBpSaWsgdmFuIFJpZWwgPHJpZWxAZmIuY29tP
 okBPgQTAQIAKAUCW5LbiAIbIwUJEswDAAYLCQgHAwIGFQgCCQoLBBYCAwECHgECF4AACgkQznneko
 TE3oOUEQgAsrGxjTC1bGtZyuvyQPcXclap11Ogib6rQywGYu6/Mnkbd6hbyY3wpdyQii/cas2S44N
 cQj8HkGv91JLVE24/Wt0gITPCH3rLVJJDGQxprHTVDs1t1RAbsbp0XTksZPCNWDGYIBo2aHDwErhI
 omYQ0Xluo1WBtH/UmHgirHvclsou1Ks9jyTxiPyUKRfae7GNOFiX99+ZlB27P3t8CjtSO831Ij0Ip
 QrfooZ21YVlUKw0Wy6Ll8EyefyrEYSh8KTm8dQj4O7xxvdg865TLeLpho5PwDRF+/mR3qi8CdGbkE
 c4pYZQO8UDXUN4S+pe0aTeTqlYw8rRHWF9TnvtpcNzZw==
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Thu, 2026-08-13 at 15:02 +0100, Sean Young wrote:
> > https://lore.kernel.org/all/6a74a76d.ec7c9571.3ac9bb.0056.GAE@google.co=
m/
> > Fixes: 2154be651b90 ("[media] redrat3: new rc-core IR transceiver
> > device driver")
> > Cc: stable@vger.kernel.org
> > Assisted-by: Hermes:muse-spark-1.2 syzkaller
> > Signed-off-by: Rik van Riel <riel@surriel.com>
>=20
> The commit message is very good. Your patch is very similar to a
> patch
> I wrote earlier (which still has to be reviewed, I can't merge my
> own patches without review into the media-committer tree):
>=20
> https://lkml.org/lkml/2026/7/29/1730=C2=A0
>=20
> I don't really have a preference for which one to merge.=20

If it's any consolation, Sashiko suggests there
is another race condition left, pre-existing in
the code.

https://sashiko.dev/#/patchset/20260808232031.500f781c%40fangorn

I would be happy to review patches to fix that.

--=20
All Rights Reversed.
