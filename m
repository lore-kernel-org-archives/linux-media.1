Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794729657;
	b=YaYPJxiA46cGTSMScbzZOqR1ODEagSpRI6D+Chwpd8Mvdf8MHamiyDrgRhm5QzWO5b55
	 U7HcIAcNdGo5UWJU+R8LtQqxnhQ6V8VIy5IXuCORwLmI0D14KifF5qVQ55/g3GXLbx9IJ
	 64oVk6QIWoMcvnWPMeCR6O+wzDk+R0Vs/7lpfdbolJo/UgNhstptCYclp/n43G3KwGNys
	 01j71WWVO/twRVdeyE9LiYBbYiKp5TUccghndsD7BhJhRgAj4BBp1bHiRKijYUFQNU+6T
	 o6LtSDCybaeZh752UazPwm5NRC/SduLsjS/Ang2Q+Mc9+6WQQYX94V0zIb0erwSbNJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794729657;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=wvcPZqOydbJbZA93vSX5EHd5IDhKbwwDJ1uTA6X1prk=;
	b=LUtR2y3X2vpk+xxbIA9m3lwIgAl8/XXCraW4MLOVOPoqwegBfMb/tGDRJNfDjWQ1dfhM
	 nbkCbzA4l8OW7nn643YYpuMUsFIokG/IkPRLd6jew+TLvzfzGBcTYrbkHFT/v65nMXwBy
	 jujJX8+Wmj71jl+banp2XMH296NZQy1S5yzJEJKuxZgfmfzsPM4sgk0m1fgwRsg0qmgu+
	 kzF1iIRrxsrtf9BjNQl0eZRx0ZoixUk7rn0v7PQZxpfiXyJaNK+R1WwfURmP9PebkduEk
	 NzY0jNgEDoSIzGL6QMP6gvo57x2bcMjAcqG0moEcRQRotl0JeWlHVP2ajRn1CH6ItAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sEKYv2q5;
	arc=none smtp.remote-ip=209.85.216.48
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B534606A32D
	for <linux-media@vger.kernel.org>; Sun, 15 Nov 2026 08:00:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6B534606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sEKYv2q5
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3b0d0f38abdso454721a91.3
        for <linux-media@vger.kernel.org>; Sun, 15 Nov 2026 00:00:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794729657; x=1795334457; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wvcPZqOydbJbZA93vSX5EHd5IDhKbwwDJ1uTA6X1prk=;
        b=sEKYv2q5F5cStHly1PzXhg2pDNY7ud1RE71OLiZ1wg52oYeVgF4GSLnfD36SWbv7gn
         KEWjaDeR48gOyq1IsILAAJykEUmn7TVJXA2ETl2z+W+0CgWywOKV9Qj+iUdk3SvGdylE
         Fwnw8ctZagJ//lUFXAACsOmAmUroHCTexpDEF5NwXjwzXMDppFMXsDRYd3dLcUej5QJ7
         mqe5Y6WlDlpzWW712NINam4esUU5TLte1ROKn5lxuer1+rKf6Jw2sog7HOzMy3PmvtDR
         WalG0ozetnCcep3jorPIV+z9d3eAWOuFKlRYLZ6Wda0jc06COV8Z6T1/zwF9QTbH6lF4
         uG7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794729657; x=1795334457;
        h=mime-version:content-transfer-encoding:content-type:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wvcPZqOydbJbZA93vSX5EHd5IDhKbwwDJ1uTA6X1prk=;
        b=JxzOWSkbJh4a9Fw7ZTJMrTJTK0yxLOqdjS8fl2SHXJ/ixuWv45EABaw4TxYMa1/X1l
         JZlojpN0gciXs541jEKLelQGxlpYpy7RYgINaKyteYuJNPvlGMZ11dWRo9wPFtLK4Ugj
         BomEzkm9yDo0NEyqPtLTxLbLKx3NO06QZvc43WltudwaeA2bBC4JNmp5k3ZjFAfgBUNa
         H1/uPJGUT+4Qu3cB5sYjcdB4DAKbs9FNr4gODapMzwAPk7BEBm0x93T32z7ghKPaObaO
         2ocVYsd3RIN3Kf4408qFWTVdfN/GNVCGgwiG5LVtgj7Vk+vFfZ4IPipYatsv7B66hX9s
         5gZQ==
X-Forwarded-Encrypted: i=1; AL+hErHdx3oEW17KZc+uqlXEvi85Qx9vcPiGRikkp4aBOgW63Dyq9G1vHjJC4B1TR39Z2rCA/0BG9xN8IOG0Aw==@vger.kernel.org
X-Gm-Message-State: APuU4Z83e5qCKzCONbKRz4/PMTM+a/cqVA1RDxqa+lUz/8DNRk7fRqfz
	gommwWVsRO5k+uifPP2wrMtgurlECeXDva1e4i8fGOkxsUFFHs4chRk4
X-Gm-Gg: AYBFou0cEL5q9WXk8h7rSqJ62WHJaSIIF8qcJ1u73U0tiJCrmr+D+Dw+kI8DRZwPwbS
	QVHTVRvQZI4f7jdnUqYb0TnJrgCPsXbJRFPXRSufcmx8e6OtQ3/Qek4bA7ngqU8QwFazlJ0veT1
	LNwyDolJlpE8/Nyz1H/BZitqRPkm/BHE65FgrbkuoTlfEujFX0oNx8890ZRkW79SuDYNATK4xi8
	vBa4XZ2h476u6A+gQHlH3E+o9RTsobE0aiSGOn0nr+eInc75ft5OIvM+sNV03eiXaA8LI7mvBlf
	JdOBCFXOEb6pi6+FLuclIpKegO1sc6qa1gG+4dmBUdI8Z1vJjO7FWMZ0E0seP0tpVmmGFySfTb7
	n44S+Tt6D79rokO9fyvWZVngRDacebwvUkZYKhSFdIgbYW51SB0IwXtgwysnEBreWuin3raKqXi
	Aw2fotSpLHCvOA9woBaOZ4l8mZC3RAh4PNoEQA8Hdasc7P4N5DK6G7BqJe8IPhyZwbxfkoBc77O
	pt7ZVRISFlFda5+BuGjNgoIenriITfTg6KRbfZSZOi3RxN3ysqDSiohNRlAlae9OcFHA3H4RSHL
	wr6tEQdlqL31SbtvB8OttYpUnHewU3Ey9Q9aGt8ozS6Gtx2ZkTZOwYBLJEsut6UQVKt6NFMVA0g
	blILyCA==
X-Received: by 2002:a17:90b:5844:b0:3ac:a7ee:6785 with SMTP id 98e67ed59e1d1-3b1b081cd6amr12270088a91.1.1794729656691;
        Sun, 15 Nov 2026 00:00:56 -0800 (PST)
Received: from claudebox.iyengar.cloud ([50.39.139.68])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1aeb179fasm11795937a91.4.2026.11.15.00.00.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 00:00:56 -0800 (PST)
From: Arun Iyengar <aiyengar1990@gmail.com>
To: Venkata Atchuta Bheemeswara Sarma Darbha <vdarbha0473@gmail.com>
Cc: Igor Paunovic <royalnet026@gmail.com>,
 Detlev Casanova <detlev.casanova@collabora.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Heiko Stuebner <heiko@sntech.de>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>, hverkuil+cisco@kernel.org,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 0/4] media: rkvdec: Add VP9 support for VDPU381 variant
In-Reply-To: <20260726-b4-add-rkvdec2-vp9-vdpu381-v1-0-180fb2d1f10c@gmail.com>
References: <20260726-b4-add-rkvdec2-vp9-vdpu381-v1-0-180fb2d1f10c@gmail.com>
Date: Sun, 15 Nov 2026 08:00:55 -0000
Message-ID: <179472965541.3841740.13087399923892139638@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Tested on an Orange Pi 5 (RK3588S), media next 48fe5a7834cc with this
series, KASAN on, GStreamer 1.28.6: fluster VP9 224/305 as in your
cover, Profile 2 output md5-identical to FFmpeg and libvpx, HEVC
unchanged at 146/147, v4l2-compliance 0 failures, no KASAN or IOMMU
fault. Not tested: 8K, long runs.

Tested-by: Arun Iyengar <aiyengar1990@gmail.com>
