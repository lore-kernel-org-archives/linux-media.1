Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794676935;
	b=C+TlIr27ivCWvxDtya3WPHkW9TCyiQ6tM/19n8kA/eUjq1DFhKUC4Ar5yIbN30OJiwr+
	 tjW5EH1fslVBoc76TJXDW7ogUSiQNJDOvlmFcg0GilHt3R2FDliwdIHxa71keLqovVeQU
	 KrObNyHEKQlDlSWw8qiYCyzpz7eTv6uL66oWnbs6+k8V2/eQ4y98ZH3gP0vGbgaYJUM+C
	 SeSB8HjlM1aW/uteWdeWXfxwQouBM3fSGUTQqlkl9tFsqm+r1dZ6iFU1+ztOfUlR/YH5r
	 4dytEtR4FyMly+1tazZPl14K2MYzGv31CSCH9xxG9KRbFk7sQLf57SZCb8fQIQLfV+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794676935;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type;
	bh=FwzkucsAfn6hqmywosgXnOrBMQHVDM+aC0JShaO2xlE=;
	b=kP43l7rrRYiQYfU1AR3pxoiHWevj4FqChXmUS0EyDIMNRgpiRwNja+iRh3HpThgc7woF
	 ju9p5FkQZ9vszb4r3+oxyTDZD8CUlgMkOQvtBpGaJp9xZZfc4AJv+OicNaqt9zNoh9wNN
	 m8V//drP+K1daQynCGPCVyzQcmmrAMPYeM9yCBSKTXcr3hkD5GZ2thMdkoVerd4mYOiBK
	 qrefdzLhGcjyo7YOFrJPp6a81T+ZrmcUjbuMDvYRv9DmNLkND9ENC3ZCh7GkcXJyoy6W8
	 4yVhEhcwQYJVlyKbxWrr79+jxJ/RO9v/XZl4bjqaO2bSOtZR3d5TYAASXq1OTHuUfGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zoid3oMg;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FDD4606A89E
	for <linux-media@vger.kernel.org>; Sat, 14 Nov 2026 17:22:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3FDD4606A89E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zoid3oMg
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a207b02a2cso11262875e9.1
        for <linux-media@vger.kernel.org>; Sat, 14 Nov 2026 09:22:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794676934; x=1795281734; darn=vger.kernel.org;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FwzkucsAfn6hqmywosgXnOrBMQHVDM+aC0JShaO2xlE=;
        b=zoid3oMgs/nx4q6gvovws+DFszFyJUWNv4K+WiBuVWoh5M+2+BWsNM84c2Sdw5vZLR
         W4gXZpyhHOrbhPoF6CfZafhcO9SZwUn9T3vEMwAz/8OGzxd+XHmUXneXnd1I00pLUtAN
         FGthAN4bi+kMcCjAUDQ4zUcgbmSoGoAGtV1SmdOMsxnzf0Ez7LYrwgxz8LUPV2JMOFIJ
         x5FQD7Gj24gIUerc+2KqADw0KzqMjaQwh6L6DYTJneDAgK4js7ha/T8dX+ZQzD1XOuIv
         PuP3lDAMEAxOHsV2N57xxEt7v6Uzh+R+cmowOqhsuCNHf3KhFvONcTmXRrjL3CUwFIyg
         75xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794676934; x=1795281734;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FwzkucsAfn6hqmywosgXnOrBMQHVDM+aC0JShaO2xlE=;
        b=TNvTVFemNvnzeps/M/vc2ePoX/asTs8ojU+DzX0RT2u8DLvX0640XuDO+RMyGDP5gf
         f4RJFmQvqb4PsnuVR/cTzSfCsV0AUnqdeyVdDyLZTcuqVupcqppH8oll0+jIeMHnh3dW
         tK5X+vWoFeA7k9MrzUEwQLeXI8H3vQlwN/9CbP0oRC/IjcmQrzOvaX9uGOknWwbBLC2y
         76VbO9F1zZBVTkygI494HgPvloV0pdsnHBgc+kLFepo48sSoO3IG4tCKcbCg/LthrJAo
         BZnfX0MPGxiLo02TEiuwwuFqePkg4BZHjycBIRYA9hqyhueiuFhXJew7UgfsjuArls+W
         YgaQ==
X-Gm-Message-State: APuU4Z//Oo60WoIwqDwZqLiAQyg3mFs2RJPQEiw5/qdFhWUCv4aXCCOS
	QCc0Djq2VHTfpDhhVC3UNIlaiXrhLJrH6D/dHm4ARTTWMaKJQI6YXoui
X-Gm-Gg: AYBFou256d7z79NXTfNPER98vcDoSQ0c2Er6Gipax1JTXZymCMRHwVEqUq9OgcTScg/
	PphouJPuVPGNNJ7fR3Tpb/nYLIdwWUrNen/F4Kn/QnZlXwLIwvYhbHheQVgdrtbpi5+QbrtgNKx
	bdLlrHiQzz1uHFhDSLoaHzfaD0z8wutu/2ykBca0ZrF+Kb8qPf1ArQa7nEwkNPOxTZD1NJrmxu1
	nGRfvksfgyhiq798DNF73k8FycB5RccXWZjdWKdt2riMj2FLxNLKWjS8iGC2owdjitEFzvHy8c0
	UIfX13aZfmqBlf365JU/3EvwMUFI0IrHBM/DFy1bwYKBzIix7wPRcdjBEM4hvAskzvXTeuP4wpT
	zdEd1ydt60w1/LwV8HqpAAFQhR9JmY458s6n6sQ+/yO332wKrEAMVI+V49I4CTBmZzReKM5MvC4
	lHnsAW4w3mgEoovCO87QGjnTYxOIKeEGPDS+E+iqqT/eZ1WvCA/pXbQ+PSDahMclt1uxnfDQ+S5
	wy3UXL8MA5wwRB6evlEZozttcpZhw32c3lmsNMgToJQyed+fd1hy48Jz+vrskcMdQIMQmdQRM7i
	CsxG6axqN0r2/SPyLe4YKdGsJc+Gq11HYi+9OVzWmVu7K7saVToxgCIyIg08/HVxHk3ZqChmhgt
	x1Rtj5x/h1YApAlV0F5vKtWBIN52arB3uWbN1Enx8AjLQFlMOL9te95QcS4+kXf/YfiPyZpeQDA
	DaYGLRiqpkl1Zr5c1UxlQlGdfZJIuJPpakRQ6IFPInREhYWiDWvo1P/od0Qxn9GpxTpEGDoCHHb
	Bav4A5O0TgOdRQi3EyJ+TTJmA==
X-Received: by 2002:a05:600c:3553:b0:4bb:60b1:4409 with SMTP id 5b1f17b1804b1-4bb60b1448dmr66581315e9.19.1794676933456;
        Sat, 14 Nov 2026 09:22:13 -0800 (PST)
Received: from jernej-laptop.localnet ([2a00:ee2:6a02:9300:bb69:6bcf:1b11:e85b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb571f976esm78765395e9.3.2026.11.14.09.22.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 09:22:12 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Maxime Ripard <mripard@kernel.org>, Paul Kocialkowski <paulk@sys-base.io>,
 =?UTF-8?B?0JPQtdC90L3QsNC00LjQuSDQkdC10LrQsNGB0L7Qsg==?=
 <bekasov.g@gmail.com>
Cc: linux-media@vger.kernel.org
Subject:
 Re: [BUG] media: cedrus: H.264 MV col buffers leak from CMA when the decoding
 process is killed
Date: Sat, 14 Nov 2026 18:22:11 +0100
Message-ID: <R-J6E8BrQTmGMr_EwXip7g@gmail.com>
In-Reply-To:
 <CAC_T2-W-2txLUANGPz7x0Vu0k9a1CScVj8eczjKLkHdwhM_F0Q@mail.gmail.com>
References:
 <CAC_T2-W-2txLUANGPz7x0Vu0k9a1CScVj8eczjKLkHdwhM_F0Q@mail.gmail.com>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne sreda, 11. november 2026 ob 22:48:55 Srednjeevropski standardni =C4=8Da=
s je =D0=93=D0=B5=D0=BD=D0=BD=D0=B0=D0=B4=D0=B8=D0=B9 =D0=91=D0=B5=D0=BA=D0=
=B0=D1=81=D0=BE=D0=B2 napisal(a):
> Hi,
>=20
> On an Allwinner A20 board (Banana Pi BPI-M1) the per-buffer H.264 MV col
> buffers allocated by cedrus are never freed if the userspace process exits
> without stopping streaming (e.g. killed by SIGTERM). The memory is lost
> until reboot; unloading and reloading sunxi_cedrus does not return it.
>=20
> Environment:
> - Banana Pi BPI-M1 (A20), 1 GiB RAM, CMA 96 MiB
> - Kernel 6.18.44-current-sunxi (Armbian 26.8.3), cedrus built as a module.
>   Not tested on a mainline kernel yet.
> - Reproduced with stock GStreamer 1.26.2 (Debian 13):
>   v4l2slh264dec ! fakesink
>=20
> Measurement: CMA tracepoints (events/cma/cma_alloc_finish, cma_release),
> counting allocations and releases per page count for one playback of a
> 1280x704 H.264 clip (13 capture buffers, 330 pages each):
>=20
>   how the process ended              28-page allocs   28-page releases
>   killed by timeout (SIGTERM)        11               0
>   reached EOS (*)                    11               11
>   SIGINT, pipeline stopped (*)       11               11
>=20
>   (*) measured with GStreamer 1.26.11 v4l2slh264dec and kmssink;
>       the SIGTERM case gives the same 11/0 with both versions.
>=20
> All other CMA allocations (capture buffers, 8- and 40-page aux buffers)
> are released in every case.
>=20
> The leak accumulates. With a 1920x800 stream (47-page MV col buffers),
> after about 21 killed sessions MV col allocations started to fail:
>=20
>   cma: __cma_alloc: default-pool: alloc failed, req-size: 47 pages, ret: =
=2D16
>=20
> and the CMA free map showed a regular pattern of 17 free pages in every
> 64-page block, i.e. leftover 47-page allocations. In longer sessions
> GStreamer eventually failed with "Not enough memory to allocate source
> buffers".
>=20
> Possible cause (a guess, not verified): cedrus_h264_stop() frees the MV c=
ol
> buffers by walking the capture queue buffers. If on close() the capture
> queue is released before stop is called for the output queue, the loop no
> longer sees those buffers and the MV col memory is lost. H.265 seems to u=
se
> the same pattern, but I only tested H.264.
>=20
> Reproducer:
>=20
>   echo 1 > /sys/kernel/tracing/events/cma/enable
>   timeout 8 gst-launch-1.0 filesrc location=3Dclip.mp4 ! qtdemux ! h264pa=
rse \
>     ! v4l2slh264dec ! fakesink
>   grep -E 'cma_alloc_finish|cma_release' /sys/kernel/tracing/trace
>=20
> Comparing 'count=3D' of the allocations and releases shows the 11 missing
> releases. With 'timeout -s INT' everything is released.
>=20
> I can test patches on this board.

=46ixed by recent, not yet merged, patch:
https://lore.kernel.org/linux-sunxi/20261109175016.42061-2-jernej.skrabec@g=
mail.com/

Best regards,
Jernej


