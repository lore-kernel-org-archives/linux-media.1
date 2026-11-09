Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794238155;
	b=b9r2XXHTuTYJl0C9i+aOTeMHpg17SM8UJh4RN4zpH4olSv75lNJ8riHPA7jfbLgqHA31
	 AuQ7IHFDBwkbK8djP1l2reqg9RIyz2VMOCbtcuMeLxtzyNQ2w2IG1ZXL+0pj0kFd3EvLK
	 1ShAJddjy1hsqm/hGCLEsbvfXoNJ5qetvcDmfB/D8GXF6yKZ0eeA13Vbtg7vF0ew4aUpY
	 bVhDzkOQm+d8SLk/oRlIAd6RDwD5WBfE02RpNxQ3gxvhum002tsNiK5SrhHrx+xUwusaV
	 OmAyOA6WnfDqxm/cBqXeDsQCMGnAohzsQl968r1ohO4HDsJ1k8Gn4q80HD0iWqCpu1Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794238155;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=uWtym8Gp7QxkU+5AEHRXNK4W470XlfYu29fZWNp2vyQ=;
	b=kSr81bJiyRTW0NlEqlg2tVHleMJKATgh2Euuf3CeT0ROHk3hklYdvz437HtIkHRLjG74
	 aPZr1iyoVxD9rrVHe1tjhKS5C6iW92xMz+ke3jG54IkJldK4kO0sCuSVA01SEbcs2OSxK
	 aeIoxRWo8SjoGE84C9mM4w50W2eEKhZ5o+qiBqC21Nv55CJsqcF+jWRfEGQzQGdTjy93s
	 e51OX0h8cnof7mBEBhusX8v7XeahjK4jMlreXhmbL4yYiUWmcT02LhBif7ZDaZ4/8SPeZ
	 vq05CvmhVtLlJ/6ZzVq9LfI9LpmD3fw+V7M1yO2eIwZAN05yDGEmLiTTRIiG6pM6q6Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="T/jTkjNC";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.49
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA996606A326
	for <linux-media@vger.kernel.org>; Mon,  9 Nov 2026 15:29:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BA996606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=T/jTkjNC
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3ac78f4c10bso492060a91.1
        for <linux-media@vger.kernel.org>; Mon, 09 Nov 2026 07:29:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794238154; cv=none;
        d=google.com; s=arc-20260327;
        b=algoerStUOYtao3887lggQR8jr6+lTmKmzBrdcuFnW9iT8+tN7MdD6K3mqnfp6I2bv
         /sexxkvDJV5qy4Y333dHvfFaWePJQbDW00CzHnNHIVpfo4eUXUIpeCJ2mquZOcj611si
         k4VX9Qe/FxBrdTdO+6VDYxQUdvkEpWCw1j7vD3JwFcVWJoFgcyxEOMzIS2sMPW8lHsDi
         0a7fLJpUAD9RPa6gNmv9KJeS/qZXt+29ILshQctXqGhC3zlaLCmRU+2jx09BWhyKY+1r
         6/b4XEDK5P0m2m44AtjvPG1xkPGydvdqbbBFW93ziGItVCS+OB5yWtovtPBGnOhj0ej9
         Eqlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=uWtym8Gp7QxkU+5AEHRXNK4W470XlfYu29fZWNp2vyQ=;
        fh=MFjimxBj2BE0PW7QGmlynszuODUobc2j2aAihP7dKU4=;
        b=BGY6J5Px/v7lQXQGZmoGTbI1gXZ0ts7n83iI9x26u7hQHeuRTeRvR5YO+V2kBoShMg
         mbSggcWTNdXQY+IYtHUsax7fF0I0y/J1UPpVTFS+1Ii1UWOuxvCclT37Hsog8BTOxndh
         8Wc6Grp4a+gJvubJFb8F3ZERkjT6QdQW4xWvf/XJrN4rvmafnjFNEse+D/17n1RC21lh
         fNBQLCkTp49HURMavAxpMmpln+vq7rEv3lOHkRtN6Li9NQR+FkK1yTIl/02wqf4eujmC
         V9XP/KkNsKz9ubaCkMIkTYWWR7+p/mdBv0/82G6E21YJvCBOlQlVqNM7j36bWB+mte+H
         nrqQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794238154; x=1794842954; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uWtym8Gp7QxkU+5AEHRXNK4W470XlfYu29fZWNp2vyQ=;
        b=T/jTkjNCMQ5s23Qj6eKbyXmaGTNzG4Q7lvTuWmj1LykQOQ7aGT2bJbvo43lmprx8CH
         9LLj7XrM091oIjHcCrolDIjdXto5lpU95EnJpdWE1cdVH6eJq+3PpVVJpNWO7bPPaQd2
         Ht3DGpMQR37bM/4HbaO7PMyNADf1QU27kU6hlopnWbMtvmxGqqUvzwfMH7KS6Gjte+tG
         1UKjNbfvOacaqH4JKx49QAA2va+1PX9QglAg94xuEPldzkImHmp6aEIxmEvUPOBKicnH
         qD2HSuaN+7IlDlkJhDDqCKlJ3NoMntoTPXFpptviYhnonjT/yiW/tT30djIe6jJoYWRr
         zmvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794238154; x=1794842954;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=uWtym8Gp7QxkU+5AEHRXNK4W470XlfYu29fZWNp2vyQ=;
        b=XS+aU++5CiU9aOd/Jj1JFspBijKkUjzKnLzah04gEEaQVR3LKeMIWXp18EFFVqn5/j
         7t9Crd8UlfTkXz5+hh1Y4dEr8y8GqXkPrKzJBVrJwME2xSdrH/d+086EoCitVMZ4lbb6
         zi9fjQugMaxTaSBYz3Z/eMVo56TjxL3wXknt0ZDTvUzf8ab+pImbC7VhqLaRNbd+ZUNP
         4P4Gs5sq+xwSfX9NHCfVAL5wE/XdqJQVvxHhjH12aGk745hgFJtU9gW/AIMqZEZk6uo/
         0dZNgSTxUdyk9bHABccog3d6L6ptqTSnAkCYZk58D2HE/ZWAwrnoN1dRyp+iyh0syvAi
         1gAw==
X-Forwarded-Encrypted: i=1; AL+hErG87mMut7sg8rRMq2CrEkfYlZM9lJ5DLgefnkcoALJTvt1uiYdAs4CXSd8ARQFdZaIQxKUzisEGIiBQ7A==@vger.kernel.org
X-Gm-Message-State: APuU4Z+I2+FYu988ULKnq++geoSteb71NqlVKHISwn+gtoYwzZX9+T9m
	wksXHpk5PdtezKmY421UKlXD/BSnxTFD6ZKXQjk2ejgjzHtAKLuKZPv/SJ3MjCM/jQg6oA1pLkC
	dfDId77Y2bY/P9IVK0MaOb+GoP7fO6Is=
X-Gm-Gg: AYBFou078J6IjSE6R1wlZW+qZmDkwkKPdwgWwAbVcftlA3yQbWkWhNlwRoG8hBIRgy8
	TbYUvNBAMRbYuB4dIK4/izgLTBLsxrw02mtsDSugVG2FmoxaPo5J9IAKIytpmllwx15khjfTSsF
	gLNdW42Fsp9rc7La640FNqJ7bAxWP01AqkxB3fb6Jo7wqj4+CoqSjYljMbX9y54S7KnANVDh5Mv
	++SxlLdzgrovPow2BdAjzRp86SH9hlNiTe+EbEs+Sr6fr++c7CAJvrDrmg1MU8E1cdcFB36rhZV
	ApkLX34ISlxrRSQaa5LjhPA57HhNDOZ3TkOYleoZ9gh+uDFXXqf8/fz0AFFTmspCJo/agF9er3F
	G5NgU3LYlVXc42iEI7vcOoT10hURzZZgllM2N
X-Received: by 2002:a17:90b:3846:b0:3a8:86b7:ad95 with SMTP id
 98e67ed59e1d1-3b12d551ea2mr4149539a91.60.1794238154064; Mon, 09 Nov 2026
 07:29:14 -0800 (PST)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261017-ov9734-ipu6-v1-0-86eab22ae258@gmail.com> <20261106213319.104745-1-afonso.figuinha@gmail.com>
In-Reply-To: <20261106213319.104745-1-afonso.figuinha@gmail.com>
From: Tin Posavec <tin.posavec04@gmail.com>
Date: Mon, 9 Nov 2026 16:29:02 +0100
X-Gm-Features: AclHuK-U8rQmDUyvnC-q6tkSSB0zdCuCY_wtvaJnryp7uBCrwIqtqh9zYwI_ohw
Message-ID: <CAOJcTPVzGOsaaPLpvShKJZ4yrk2Yws=dA4Q0X48N8UeS-24siQ@mail.gmail.com>
Subject: Re: [PATCH 0/3] media: ov9734, ipu-bridge: Enable the camera on the
 Intel NUC M15
To: Afonso Figuinha <afonso.figuinha@gmail.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, Bingbu Cao <bingbu.cao@amd.com>, 
	Dan Scally <dan.scally@ideasonboard.com>, Hans de Goede <hansg@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Afonso,

On Fri, Nov 06, 2026 at 09:33:19PM +0000, Afonso Figuinha wrote:
> I tested this series on a Microsoft Surface Laptop 1, which has the
> same OV9734 behind an IPU3 CIO2.

Thank you very much for testing and for the detailed report. I'm very
glad it works on your Surface Laptop 1 too.

I'm now working on v2, which addresses Sakari's comments. In patch 2,
v2 will wait 8192 external clock cycles after power-on
instead of 20 ms, and request only the reset GPIO. The changes are
small, so I expect it to keep working, but the shorter delay applies to
your Surface as well.

I no longer have the NUC M15, as I have recently moved to a different
work laptop, so I can't test v2 on hardware myself and I'll say so in
the v2 cover letter. I would be very grateful if you could test v2 when
I send it. I'll Cc you on it.

> I posted a duplicate series by mistake before I saw yours, and I have
> withdrawn it. Its patch 4 sets V4L2_SUBDEV_FL_HAS_EVENTS and uses the
> control event helpers, which fixes the SUBSCRIBE_EVENT failure. I can
> send it on top of your series, or you can fold it in, as you prefer.

Please send it as a separate patch, under your name. It doesn't depend
on this series (it applies to media next as it is), and the
SUBSCRIBE_EVENT failure is there without these patches as well.

Regards,

Tin Posavec
