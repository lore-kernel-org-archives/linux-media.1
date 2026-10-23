Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792742522;
	b=PujDwv/SiY9/zKZVagYI0x9pVAYVAZa7TuxcI9unvV0AqByB19lKiyTPtS4t4IKQK4Il
	 4jdNW5/67hsEpuKANCw+6UrqMUPxl0wm/kIPLytoRGTSOPk2dfxenidP2Xq8WLt3gk9Zq
	 6SKnzxyk23YrobnvqfDXeeg+ZixuBznRpVNgUDyunjJ2IwPgE976W625uYroO/wdzhzxa
	 2eKum6JMJ8egDRxUA6gFoYH2mXvmkI06Fq6scZnYqnEz1A666eXHzKK52f5HpEXNh3V6i
	 digmiZx/b5wxkMD28hSwZUDovxv6ITdYG7zO9F5GslzsKRPulvOZ5K1Q2UuVtSxla7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792742522;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=i4dWKs4ci8K3OMa5e1MlzMTJiiLuTKUPNju8rpwDqTM=;
	b=eoYRBmB8TkZSwWg6FuV4SvAjEe8McRWRzfd7rG+4WvEHaufxN5xr8W6D3zSVz5CGIWCC
	 IG2PDLDQqzd0JiPaEEk1zNAX9EEq9PRDRj1fQAC7Q2ib8jzrOhWyY9jWPihR1bmiq15tY
	 Q05B/7h0NVd/7eD/aya3m+ZJurC0ewM8X2ewqvBJnNz4Plcoeceky00Pkk5y0xlAZNpFq
	 7p2Q4ma5TNz3wOyimoOV9vaxhf4ZwDkCqAN39cacePZjXRUWWmabrPLyc+7HsU9anPmIs
	 xK1JK/RtFhAg9gn7whZLLfgE4vswG1OWMJ23pjwqGrzDcmp/1PN+wLPksw7MF9nGz7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=HD41iG65;
	arc=none smtp.remote-ip=209.85.214.176
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 293BB606A31B
	for <linux-media@vger.kernel.org>; Fri, 23 Oct 2026 08:02:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 293BB606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=HD41iG65
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2db80fcdf8bso3123825ad.2
        for <linux-media@vger.kernel.org>; Fri, 23 Oct 2026 01:02:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1792742521; x=1793347321; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=i4dWKs4ci8K3OMa5e1MlzMTJiiLuTKUPNju8rpwDqTM=;
        b=HD41iG656yMUK102wLHCu+QycKWyUjK+pNlZxmmUVXYay/KVDi9lZS2AwdBhibwgsp
         9StHGFsh5f4NgHgBgukCttMkj5COKB+Nt2hJzZXv9hwByjCtmed4HfgvN8tioaD5xu6W
         J2YEosyiu4BlV4JS8GWaDx4EzoOzGISn3RCAw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792742521; x=1793347321;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i4dWKs4ci8K3OMa5e1MlzMTJiiLuTKUPNju8rpwDqTM=;
        b=rbiejvmxQ9I1rkTfRnNXGKKFVzzboYe8BSG2AdHmGZ4rfi8UeqzPIzCTwZxx03xx+r
         8gtJcfFx5icQcFVv1ksa1Ge7G7FuzBdUHqIodvUhldKOAxB1gTBF5jk2BE/0ZjPWGC/9
         YBo4vibn6wRA+yrFpgyEY5Z8UzMWfeV7NkHeSw2H17fonHIuYFYYorhlk3fDy+kmiPnk
         C5fbE9EbrmAdssVU3VaLRTd8Z++LVI3mrWUuR8zsrlfueOF+bYU211IlGbjz9rMoaefQ
         fimXGqPSoaSKpQbYU0FzR0ym3p4u28mYNiwCsu58lKpWRBbxAmD/wDSpqsB3BhO60SrE
         wfsQ==
X-Forwarded-Encrypted: i=1; AKwUvBzsPhJcVs5P4ZX71nFEsWx3WWt4sY0wMpIZtfp3lLZtb8jQkem2FBb0R1WmSZwhgwsBtCbEXpGq+pVQKA==@vger.kernel.org
X-Gm-Message-State: AFq9FYIBDyBmHqlLBmrCWLCtAHqgdM8R975Jawhc/P2RYJHunhGFBqkv
	mjA9pFSobKTUgrf4LxzJmU2LJpB7r6MJatPpO5LQToExyxqggJ5S/uK/YOSLWi2rFAUsiXljwzM
	8lvV2nfiS
X-Gm-Gg: AYBFou0X3LGX6iekGTfWzBdOU4n0LZ2EVGwuIZPnpSYUnokktKPzBVylQoaojNIlHbS
	4712fAcerOPVaBOkK6e4B2hX38M3515yadOqSSGQ+yHfuAxR3Sln5BauaiPH2FEOPYpvPtuCM3p
	hfYf2FGWNk2D/lRiKFMPFJ0IDvfwvsehajdHUeEbbtcFazqpSdqpP/L3tHa9IFFQP0YQhzLydZL
	HsbJSl/nwxCaVabKe+aGNiEwV9Xu5Trdi19DinIy9p0cyjp389HfPSrqFSlTYiiFp8PeP2HDx6Y
	IDqcDmG5wYSFVkQulf2Ag/c4loPSy6nrpFiyWFwN1XGuZ/34cMsBqCO6iRIYGxrN/c+DSy56DFw
	BT0JiKbxUA6ljIHyf3pcBQtkcYe/43HQXwZ444bVXIfMb4UhVyA2VMXyw5Uu9V+QR3RnmVnCbh7
	2rql9nRvUSazOIbEBTkBfAZEOiJpDrFO1PcakoIE7utVS/EWz9nY8b6m/Q4s6bvu1TPeyz2Uumk
	VBYs+h0xA1aFljWvJpbAITg8v/o0PE8N3dUOGChp0jo499fV5VI5MUP9p4hzkW9XK83wUvbOR1A
	SAvLPkEErFYkyouMenI=
X-Received: by 2002:a17:903:2b05:b0:2e9:8510:6ae0 with SMTP id d9443c01a7336-2ea7d03f6b9mr14926325ad.44.1792742521340;
        Fri, 23 Oct 2026 01:02:01 -0700 (PDT)
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com. [74.125.82.182])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea7b367551sm7148025ad.30.2026.10.23.01.02.00
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Oct 2026 01:02:00 -0700 (PDT)
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-36681e85e87so1548532eec.1
        for <linux-media@vger.kernel.org>; Fri, 23 Oct 2026 01:02:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzAWDda2O+l+O1g50Z1lC6ghdibimfBNRP88Wmtvy+ot91BDmkshpeay7IIq99ZteOmxKsVHRfD58VFiQ==@vger.kernel.org
X-Received: by 2002:a05:693c:41d1:20b0:368:6841:c4fa with SMTP id
 5a478bee46e88-369d97cba44mr2146857eec.25.1792742519525; Fri, 23 Oct 2026
 01:01:59 -0700 (PDT)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261019060825.4163770-1-fshao@chromium.org>
In-Reply-To: <20261019060825.4163770-1-fshao@chromium.org>
From: Fei Shao <fshao@chromium.org>
Date: Fri, 23 Oct 2026 16:01:21 +0800
X-Gmail-Original-Message-ID: <CAC=S1niGn0omF1WCr3NbNvY6jZvqZu=3EOgrPEXR9ER7L+onfQ@mail.gmail.com>
X-Gm-Features: AclHuK-R_JeODaJVMp0e_2XshjhzldOiDGJ3AA99g544rt-KmJQNU86dD3TgdPI
Message-ID: <CAC=S1niGn0omF1WCr3NbNvY6jZvqZu=3EOgrPEXR9ER7L+onfQ@mail.gmail.com>
Subject: Re: [PATCH 0/2] media: mediatek: vcodec: Fix NULL source address
 handling in decoders
To: Yunfei Dong <yunfei.dong@mediatek.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 19, 2026 at 2:08=E2=80=AFPM Fei Shao <fshao@chromium.org> wrote=
:
>
> Both the stateful and the stateless decoder workers peek the source
> buffer and, if vb2_plane_vaddr() returns NULL, finish the m2m job without
> returning the buffer. The buffer stays at the head of the ready list, so
> the same job is scheduled again and fails the same way. In the stateless
> decoder the media request is also never completed.
>
> The two fixes are split because they fix different commits, and the
> stateless fix also has to complete the media request.
>

I sent v2 to fix an issue where I misused mtk_vdec_stateless_cap_to_disp():
https://lore.kernel.org/all/20261023075642.3671805-1-fshao@chromium.org/

Please disregard this series.

Regards,
Fei

>
> Fei Shao (2):
>   media: mediatek: vcodec: Return source buffer on NULL va in stateful
>     decoder
>   media: mediatek: vcodec: Complete request on NULL va in stateless
>     decoder
>
>  .../vcodec/decoder/mtk_vcodec_dec_stateful.c  |  4 +++-
>  .../vcodec/decoder/mtk_vcodec_dec_stateless.c | 22 ++++++++++++-------
>  2 files changed, 17 insertions(+), 9 deletions(-)
>
> --
> 2.56.0.176.g3575e65682-goog
>
