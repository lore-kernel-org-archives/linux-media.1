Received: from shelob.surriel.com (shelob.surriel.com [96.67.55.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8AD12EA754;
	Sun,  9 Aug 2026 00:59:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=96.67.55.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786237186; cv=none; b=L050koEaQgAglPhCEzj7xeX5YSG+ztgH+bGFvDYSta8mTBNi/sD89T1WdHrLxTuOIC3lydF6mimp5RxRyom3q1pRwH9311ReFi+0EioddErmM89O7mqHvzltb5g9JN5ozz2PVRe6CkBu2DcIqBNIMGVt3/rjTCkYOs/ifMKizbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786237186; c=relaxed/simple;
	bh=MlrHe0dHerFeo6sWvZyHKVxvsJTHpZJjAxD68LyB2uU=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=RN3650hptVGTfEGNCC95YDcRRir9akzE2A6OeWLFrrrnwYbhIOMW7Qe6jcxd8zbzp83/bW3MRo3xaEfxQKGR7ckYd6nBWzubBNsueSlaOQW1cwKusVIUaaCa22un4ay0xsdVpMKFdXOKRylaWg2SO8u1k4UymjkgHy2HVIo5S2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=surriel.com; spf=pass smtp.mailfrom=surriel.com; dkim=pass (2048-bit key) header.d=surriel.com header.i=@surriel.com header.b=XNGYnT3M; arc=none smtp.client-ip=96.67.55.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=surriel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=surriel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=surriel.com header.i=@surriel.com header.b="XNGYnT3M"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=surriel.com
	; s=mail; h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
	In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=MlrHe0dHerFeo6sWvZyHKVxvsJTHpZJjAxD68LyB2uU=; b=XNGYnT3MS+KsqIORpvboHccuAG
	ocwT7tq3Gi/lhUfgIOHXi7tnKpFAvDFqPKNuGrGDPEJJ5SUIDASg7dzv/oAK/UOsAH3ZwEx1DCJca
	uuX1yLAal2f6N6fvbAAcU1iGJ+iWspQFCG78I5hlGXNzVGenKqsx4ANS75OYdsnsbBRw86SbUdrtz
	b7YN/wf2enUBw60k11ej7TP2HA+QwlTG8GdX/kUt1rRHnN9w/9UBlySdvAzUOAqoGPHahd+aNiSLq
	5kP1NSmHt9AoMo+RmPDNDHIzH6rQkZsmUNS7mvg6N3RwOWVjPolNLatWDIgaOSfN3CVR2wNrYRObp
	q53wBGyw==;
Received: from [96.67.55.146]
	by shelob.surriel.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.97.1)
	(envelope-from <riel@surriel.com>)
	id 1wsrt0-000000006Vy-05gP;
	Sat, 08 Aug 2026 20:59:34 -0400
Message-ID: <44e707b3577947fa7702b44f79c5dc0f72278409.camel@surriel.com>
Subject: Re: [PATCH] media: redrat3: fix UAF in probe error path leaving rc
 device registered
From: Rik van Riel <riel@surriel.com>
To: Sean Young <sean@mess.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Jarod Wilson
 <jarod@redhat.com>, 	linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org
Date: Sat, 08 Aug 2026 20:59:33 -0400
In-Reply-To: <20260808174213.1d68336e@fangorn>
References: <20260808174213.1d68336e@fangorn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Sat, 2026-08-08 at 17:42 -0400, Rik van Riel wrote:
> redrat3 stores its device name and phys path inside the main rr3
> structure, and the rc device's device_name and input_phys point into
> rr3. When the RC device is registered, it keeps those pointers.
>=20
> =C2=A0 KASAN: slab-use-after-free in string_nocheck lib/vsprintf.c:648
> =C2=A0 Read of size 1 at addr ffff888051fda758 by task udevd/7464
> =C2=A0 Call Trace:
> =C2=A0=C2=A0 string_nocheck lib/vsprintf.c:648 [inline]
> =C2=A0=C2=A0 string+0x216/0x2d0 lib/vsprintf.c:730
> =C2=A0=C2=A0 vsnprintf+0x74a/0xef0 lib/vsprintf.c:2945
> =C2=A0=C2=A0 vscnprintf+0x41/0x90 lib/vsprintf.c:3014
> =C2=A0=C2=A0 sysfs_emit+0x10e/0x180 fs/sysfs/file.c:761
> =C2=A0=C2=A0 input_dev_show_name+0x58/0x70 drivers/input/input.c:1282
>=20
> =C2=A0 Allocated by task 10:
> =C2=A0=C2=A0 redrat3_dev_probe+0x477/0x2570 drivers/media/rc/redrat3.c:10=
23
> =C2=A0 Freed by task 10:
> =C2=A0=C2=A0 redrat3_delete drivers/media/rc/redrat3.c:466 [inline]
> =C2=A0=C2=A0 redrat3_dev_probe+0x1bf4/0x2570 drivers/media/rc/redrat3.c:1=
124

The bug is real, but Sashiko found an issue
with my patch:

https://sashiko.dev/#/patchset/20260808174213.1d68336e%40fangorn

I'll get you a new one that fixes things right.
