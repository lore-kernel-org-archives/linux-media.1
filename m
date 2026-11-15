Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794729702;
	b=T1Ss1d/HJoOV/M+H3dE24YSSNu0pjUsk+4Af4C+U7Z4TPi0Dt38dqVwvmkBDL4njMx6S
	 0lMBZEh3XYH8xE+Uoxj5qDC6d5yp76QdT6CHb4UQeB21R9IWukdXDgXPO/+54AqHFr3Qf
	 8TMS5DZQ1/lH9XF1LvqH+okooJS49UImpYzZBvZdzyqzVElRHi5/Hvc5nuuBGaReLIkhU
	 cPfQNy7g7x3UdVmBnzImIoRwJS+0IMshBZJ0h2iU+iRXnyG92/AxO/JwkAEDNuKa+JUZx
	 siTcCXJjrVgEoevMK/INSturxy7kiRHgP4MBVV/0D0i59HFM7yr2pqch0MACiiiHyzw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794729702;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=80dMFC0Ro/jAPdAujll83Boy4CMrv8kmaX2kTiPJvwU=;
	b=FOqb7myWIzB/eOv/8H9k0G0OMZHOK3IVrwdEOGVndUSj5C1OXnQmL250aWiGTnhPmrOS
	 GeduyzNMoxb65XuhDvZEW4nvQaTKmCh5xZdVARe422j1I3QK56PzdXYP0axA3W5jQ+vSv
	 kbWc/rVxamewvGy8vSE/gap7Tu1oqwYuwX6AHW4eIXlmqbg/Er5t7u9Y9CxG1j4pcPfyo
	 PizMorglQI91GqrQBnQr6mVd7uIVOtAyJIVXArLiePUJjkjZn76SmN1uGdwWODX6cbdVB
	 /yXUERs/aYCNv7xioiJuPWCYoFIXBG++wdzY1F7Ar7m4Z0dNKdpTyyW2RJKn0MyDiHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="Si/Mdjj7";
	arc=none smtp.remote-ip=209.85.216.48
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9B7E606A31D
	for <linux-media@vger.kernel.org>; Sun, 15 Nov 2026 08:01:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B9B7E606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Si/Mdjj7
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3ad0c2e71ebso348287a91.2
        for <linux-media@vger.kernel.org>; Sun, 15 Nov 2026 00:01:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794729701; x=1795334501; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=80dMFC0Ro/jAPdAujll83Boy4CMrv8kmaX2kTiPJvwU=;
        b=Si/Mdjj768sD2q668cuh3FitL/nAinn/bgSvLZLfFWYX0LpPiohHIGDiNgK5SUCv2s
         xeLw5794RXcgnMHhCp9xDvPmq/vLHuAQCIQfBAqiBZpAxJ62UaDA+KFyusJFpRvunoJq
         wsbQCfUKfi1MzsodkZ9wo/XTgxpCFuVehXzLJcv5Agxn4tbDelLymObZhXcrNdgOsKEU
         LPMC+IkNMD3ZPE1XWM72/Lg1eMbC1nAfx9VdZ81b7fRMYNYu1J9lTGnC8vRjQzRCnjd1
         LG6cfL95IKft22mmJBQLcDHyAFVRkVTHLbxeaqPNBX0xLpo+yln+zqYLjyWF5axUa047
         RGRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794729701; x=1795334501;
        h=mime-version:content-transfer-encoding:content-type:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=80dMFC0Ro/jAPdAujll83Boy4CMrv8kmaX2kTiPJvwU=;
        b=WVDb4E5TdffNyZQQTqjGFh+TzhwCLRhES3IkbMJ6NbE2r8QmOmOKPDiOAfqa9yOGOY
         cJMFFIqtTp5cTSmqqQb12XsX4xaAfmg0/br8wQ4Qur6/iVG5ArW6ScZMMWC9kwLjUIMl
         2PjEP/UamkgUQD2N4Yv8rWXff1xDqR892Kfp6Who9dDSy+jAQltvoqeEdvlJMWwahkwS
         ImqEfD1jHExB2CDDtmOMZW3dZbm2Lp5HfKsfYWXhsJg742wEMchYinDrPh1WGJ3LH5j7
         Ns1P3BOrLLZ1WSLBdciLaddfvScl4XfD8Om+Go4Z09PxTsl5ZO2H6g5Qg6FyheT97H3b
         +dkA==
X-Forwarded-Encrypted: i=1; AL+hErFOY1fl7sPLxD8eZa92ALsckoorvZmVQz/kA1uFAnLFas/gLbygdsD7SJCFIxU0FBjHIDB2elQ5aHO24A==@vger.kernel.org
X-Gm-Message-State: APuU4Z/eKSxJxoOj+CBJRebZyRl5gu124yLH5zNfcwtHm4w30sK4jEGW
	PO4fyb/2jdSRQDsMTzKC+JUC64WJt5n/Y+CpkMY2RfYOPFhnT8rZ7+d+
X-Gm-Gg: AYBFou31n7p1P3o9rYx4VUZamzEzAJ42HaM380A+uikusOF0KMFWI+cg7sbVQqGsqAs
	rxutCzOAeey597ZW53xkq1gd6VkU7qI6BhfnyEhv0O/6e+vMY/XuUChVFNx/ImypDiclIU+Pg6h
	zJTmbvAFArRMVYUW6kDa3tPKMijx9EBuGWTiGvcGGWD7TXkDdqF80KWhK+wYeKLBYiqoFF0SBd+
	2wQhwYnocpaCGQc3EFqB3u87+BO7cLEWacB/Vy8kvCkFHY0Ksnjy3Fo0prbqN2iMs/bIKJ0Xjo3
	N2KwjQtvGhKTh6518X5kRQWtMU5WeD0vGKpWiKnajnS7oJp4RqTkCCykaSoUoD1JpTZ7pgSHZ0m
	9FOirDclmN/8KH7r8mLC8T2m/tW6MXNqs29WzzS/CUSQMw+W8qN7ePNDD9JKUYz6h6OsxkPbEbe
	JNHyXUTRvI7QaZi8MKtKmSXbiEQfiQLzmsdNyS4fg7k+8gcjV1SLXaV4SrOpngVXacRd8U24HWe
	j9GECy5U5ScfZjrpZuJg00PfkI+ms9ByErGsNfGS66v/Ou+hvbE88/D/ch5rmXdtMjl4S9xLyD1
	7lC6Sgxavl7xZ6NO+rOgmrYfxkvV6PQKuo2aRUEd/CL6Tr9G0edjyCTjc/Mw9udt0wsIpDMJRpM
	ABUybZ6o=
X-Received: by 2002:a17:90a:e7c2:b0:3ac:73c7:9c07 with SMTP id 98e67ed59e1d1-3b1b0608b39mr11786795a91.0.1794729701017;
        Sun, 15 Nov 2026 00:01:41 -0800 (PST)
Received: from claudebox.iyengar.cloud ([50.39.139.68])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1b3a21769sm6224118a91.4.2026.11.15.00.01.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 00:01:40 -0800 (PST)
From: Arun Iyengar <aiyengar1990@gmail.com>
To: Lukas Splavec <lukas.splavec@puresig.cz>
Cc: detlev.casanova@collabora.com, ezequiel@vanguardiasur.com.ar,
 mchehab@kernel.org, heiko@sntech.de, linux-media@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH] media: rkvdec: Use dma_map_resource() to map RCB SRAM buffers
In-Reply-To: <20261114094916.28744-1-lukas.splavec@puresig.cz>
References: <20261114094916.28744-1-lukas.splavec@puresig.cz>
Date: Sun, 15 Nov 2026 08:01:39 -0000
Message-ID: <179472969996.3843098.1159119154248532841@gmail.com>
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

Tested on an Orange Pi 5 (RK3588S), rkvdec from media next with this
patch, KASAN and lockdep on: all RCBs in SRAM now use IOVAs, no IOMMU
fault or splat, fluster HEVC and H.264 results unchanged.

Tested-by: Arun Iyengar <aiyengar1990@gmail.com>
