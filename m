Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795814218;
	b=gf6+KXxStfBQOuxROrQP4JlnhGH5dSsPJbM9prrO1SIZmqbaiVkuIWyjl0hlGTn2xmc1
	 6+LkQDrJXytnZRq7hWBlcT7wvyMfTtZvzGFJL0Hz/8nT4AbjxiWKqLHr7dHPT64XNK47a
	 iU9nbb7bmog9CEvJE9GOskdP6wQjFW6wGctB+59LfCjP+A4Sfzes8ncsSZwE974B7tl4z
	 vLID8MGTwR+pYUDUbUkSd2TdxkdDOilWbfKKI1R/6IIQ2G80H6CLIY8tMQOB8VfR+YLrn
	 DnMgHAZj+ZpWOKDb7nm6LKAJqID7VfgRANwxo0Hav2U5uCsk/4uXXnw0Em3ixbWZ/7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795814218;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=CRH4oHfnMzxi8/K2BwsJajSyfFDJmrtR0lIrzcFdbWM=;
	b=BdXr5n2YfJ7cT9+HS4VLjNrd0y80Ysf89s5kwxdQ3lTdE+I7yTfcUiDCimO7OvNwKiNR
	 iC8/P9FuhRqt1iiEG8ZiUBfzZtZGMo1TsxR2J8Dw0rCqeuv619TloDnTD5aCOtf5ZMskT
	 gbVAPVTlQKgut4/ai/QeFEvMgfSI466dNe+a6iHCzCVGwMfATAdftCJ/55YXFHOCW1aJO
	 oPgy2G+z6+4T+kRJe9MZ51FVLP2DY7adbYTl38F4pLHdENTY7hwMFp0NqQheEz8K/e4rm
	 LbS5+8lgGmSsVbvDU7DqZKrLoS0TxRovIdJ1qE2erLRouiUm/h5vud3hQHjPINEOEoQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IpVysC+p;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0635A606A31C
	for <linux-media@vger.kernel.org>; Fri, 27 Nov 2026 21:16:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0635A606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IpVysC+p
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-38622e0dae0so949623eec.3
        for <linux-media@vger.kernel.org>; Fri, 27 Nov 2026 13:16:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795814217; x=1796419017; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CRH4oHfnMzxi8/K2BwsJajSyfFDJmrtR0lIrzcFdbWM=;
        b=IpVysC+pjgTWme6Bxd97PUnsroRns0XK7+pwKX+CjAp31y9kouicV0WP6GpbAixeEy
         Dz8VNmDL752Tc23gDLat7jb7iroXeP++uRNI0ThDqgUj4bBE0yQdwWmGIXyBuihHPnl5
         HC8hoJKcWquD0ootL9JJPVd2wAmGi6QcBJ/mk9J1kIASBZzYvNevxMb8lieL+tAV5koq
         ryQ9mC15eylNE72/WF9BEdaQiuT8XKBPY+Vh6ujkaL+kgVM/ZRpQw8MqSDiGHo7U0jRK
         Qt7mfWQvAE8v5cxCY/26zwxpVsGueMH9C1NIkW7fuVQxQXMo2dxGAYAm4LUywVkvKO5k
         0jpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795814217; x=1796419017;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CRH4oHfnMzxi8/K2BwsJajSyfFDJmrtR0lIrzcFdbWM=;
        b=Kf7vpjBkZedUvn9XgjSg0a+aFvp5TSlpkfv6ETUSiTlqMl+BXUdwHA1pU/oSlPVXov
         xnE5vH/5xvhpv3kfm7Ms+XHORXBdXB5AbecD/kvq0Y2Fv2Rlqq9XxVxr4WA3lpKbQvtz
         oEQhaLHnPk79ITiFO6wLJpWv+CsG7s4sx2WMhOWTZHrLw4rYby8/Ai0UymE0Kdo+Zi+F
         imQNTikvbigUr+OlkKixjaEfU+6JiUkIFoMpCgn4SrClfarPJnRbd3GH1UA/7mHxkeb7
         tOYSUXKJF9CgKRa6dRcBGRvGxfJ2ooE5lgBAL1BI9Yu4k5BEky1xlX6xPw+9qMPZPN0e
         KZRQ==
X-Forwarded-Encrypted: i=1; AL+hErGAgXJL3rumsSJQEsLchGVtn7/b14sZyMY1DKF3lpgkdH6zS/CyKPk565Tjd4ITjLRc5/hsAykLghuqiQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z9D03avk8SD/FNM2Nof+bxEfVB3Yd9JR/7TyXlqtHGMQLAUCugf
	ft8jpMiVXzjOi9bCsfsaYbebOB5GqudQeBTidGTYXtNDLomfL7gjoHrV
X-Gm-Gg: AZFdTZfJUm1As3cc7810JurEMpQr5RtVjMg49Ru/md99HLdg06gZGjqpGH5cZ4l10Rh
	qKibpj2U47UjHoMnl9UeNJvuyhlZ/YdeQFsVDLOyrkJtQwgjr2220VK87srLrzTiQpXP177OST/
	k/Qxojv6shEPZaw8S1QOgv943qf2tk9hlj6pZI3TfMXse1UoRVB27/itjQa2PssikBa782W2QPj
	XP1GgfxlV3yywGWyZbPwpl1XBEjCkydVk5jXtL1u/7JndoCZ2JIJB2D0To/IgH/q91Dq3AEqStf
	80uThEqdOMhK1FQpFfN+dNqPd60qoXCes1NCbKpYR5ZqGrH8tnmGpQCtPSb+bYAf6e3pwUnsqOO
	Xkq76+I4FrMkuAy70uhHi9uq1ert9u8H2iZlB3Uc31o7LfWe3BxU80rg7h4xv9G01g1l9v62X1s
	eKdXM3Hix4X2Tf72PFFOgG/bpTfHJSd2/a37SsCC2aRkRBQLe0PhE4AHdL4v8P1EpgixzLkyu9X
	NbwBdv+5rAwixD+AUGuz2orn5azMnVZHRHd/dxDVaccGnOE+V8O+lNqaaC+4F8Hk/UAy6LxH9+i
	2cGAuCHBGgKAr6pXmUA1t1W4rIoUghAwQ29ufuA0lpVyGExGVlQ3jkNUptP+5sDTl2pzZxMLMVp
	gK+MTGKhVSr1gEVwk8wurU+LUcUt/zdFm2qTB5j6sCYV4gY6v5iMlZXd3JoLdFqpTKKMSJlUyle
	bEY16ZovihvmE=
X-Received: by 2002:a05:7300:16a3:b0:36d:5fbc:8c8d with SMTP id 5a478bee46e88-3856ef457b6mr36627178eec.2.1795814216956;
        Fri, 27 Nov 2026 13:16:56 -0800 (PST)
Received: from esteban.lan ([2001:f71:5160:2b00:ae2a:b9d5:71b7:3bb9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386aa203267sm44068331eec.0.2026.11.27.13.16.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 13:16:56 -0800 (PST)
From: Antoine Pichot <antoine.pichot@gmail.com>
To: Robert Ijtsma <robertijtsma@gmail.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
	Jacopo Mondi <jacopo@jmondi.org>,
	Todor Tomov <todor.too@gmail.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/4] media: i2c: ov7251: runtime PM, non-continuous MIPI clock, and strobe OE
Date: Sat, 28 Nov 2026 06:16:53 +0900
Message-ID: <20261127211653.1675314-1-antoine.pichot@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127-ov7251-strobe-ncont-v1-0-cefa8c6c020b@gmail.com>
References: <20261127-ov7251-strobe-ncont-v1-0-cefa8c6c020b@gmail.com>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Robert,

Your patch 4 adds the same control as patch 8 of my ov7251 series, whose
v3 went to this list on 13 Nov:
https://lore.kernel.org/linux-media/20261113024059.1087031-1-antoine.pichot@gmail.com/

Mine drives the same STROBE pin, for the infrared emitter of the
Surface Book 2 and Surface Pro 7 and 7+, and its
V4L2_CID_FLASH_STROBE_OE is off by default too. The main differences:

- The pulse follows the exposure, from 52 to 776 lines as the Windows
  driver clamps it, and never more than 45% of the frame. A fixed
  512-line pulse lights about 60% of each frame at 60 fps and 90% at
  90 fps.
- It lights alternate frames (pattern 0xaa), as Windows Hello does, so
  the dark frames give the ambient light reference.

Could you please try my series on the Surface Pro X? It has only been
tested on Intel camera interfaces (IPU3, IPU4 and IPU6), so a Tested-by
from your Qualcomm SC8180X would show that it does not depend on the
platform. If the Pro X needs every frame lit, I can add a control for
it. Patch 8 depends on patches 5 to 7.

Your patches 2 to 4 conflict with mine, mostly because my patch 5
converts ov7251_s_stream() and the driver's lock to the sub-device
active state, so one of the two series will need a rebase. Your patch
1 applies on top of mine, but my patch 7 moves the common registers
into the global init table, right after the software reset, so your
wait would then come after those writes instead of before them.

Kind regards,
Antoine
