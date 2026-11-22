Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795339013;
	b=OUIVpHKReNw44zzinWQ2WhRgPDNr94l4yBTktHkoBXNr6J4/peUezAH5/2XDrq+y3YyO
	 1l31ggguUbVe0rvXJDLzuf9PgQTzVGJFabUsEfruEUKg6HZ4ozDv1OUCe+evbgjPspKq6
	 clyqgJTVLFEWMGHDw9Yzxq1nEIeCtb6gA5zLy4t4/6HD07uPB34CzqOye5RIqBa2RXssL
	 FJM4LOxZnkEEtyb6Uq4IrS1l97HPAmdhFn+xkqpIBpcg56Ry1FJmDhmN1ZQ4JUB+8GIq3
	 Dc1H84bn3bSU/mAfT03vFshHSK22pKQ8zgmOKIGjo8FFcnR6j3IN65+ivlNBvbGfsxw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795339013;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=jlk4MoliGvZW1IkxqxKZvX+OlKzVs5YdkLc7yt4n2p4=;
	b=DnIDrdaVfTSc4evC2rOPlqbM2L+c4KdukNpAKYJtB3xdkzyGpoaJLzebJ9d5MrGaueG9
	 frmSG3Xz77xZTD2xx61mIAqUjg+BlzG4lMpj4P0vmgpgIMdZ1M8wyGNOwQGFmYeidVo3o
	 lo5uZ7SdJBDaqIQjeCIRZbymQWRV59sRSXj76zGQfpwkcLq+GtzS4VLYz3+OvlIcqgJun
	 CIy6e2WKZrU632Jb+Dv/NUsjrwsI83V73Q0wbaOENsn8jT2NXtxan78Ni973T3jBIWg0K
	 8dML1edpEspTdEGFokn37UUAegwwsIfu/vUblxC3WoqTSyQEmETEHCaugl4OdUncMKw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rSQajXk4;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.42
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB2CF606A320
	for <linux-media@vger.kernel.org>; Sun, 22 Nov 2026 09:16:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CB2CF606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rSQajXk4
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5c0ea47f5b8so238501e87.3
        for <linux-media@vger.kernel.org>; Sun, 22 Nov 2026 01:16:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795339011; cv=none;
        d=google.com; s=arc-20260327;
        b=IXutUh2vfpc3p/x0ksJJj3bL3mI/K1X+vk31Yo/3oNdGQTbwpqvmyqQkpyr06kemoF
         EuQgmuPPhLNwPe4+ERmwS2T0iPUR7xaXMlywmJncQJtrW6J6gXGaanLABFOhtgyeKG0p
         yZ4eJ7r8yoR0J/b7Vhuz1x8h6nNIdT8CN/+DTj0K//3ZHF4LZ1QxktyqopFgtzfRFzNN
         YhGaBZ4CCo3yof4+aNcjd3DmbAFisA2L6pnQ+DWFK1uViJtb0QsxzcvYcH7tcdWcZvOz
         IwuQy4futZiZYirf9U4rYWN0tVcF0GAtfF8wMwGcn/mNSOvA21bS+C0XhrLywo1KENgP
         iInA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=jlk4MoliGvZW1IkxqxKZvX+OlKzVs5YdkLc7yt4n2p4=;
        fh=TLgkgGnL+Akvmn1cDxKWDD/esj3N8A3+ApqgPqm8XSk=;
        b=VjfaPnVJbFGY25TNM/3ZSZbFt2ZD3j+Jp6Vv21H7oTWt/5Uyqh/7RQibKPLzUbrmye
         SyZHeuGuyz9LRHN1tbWWEAo5Jf379QMUUbWZ3XYX2v9jt4bicNoT63OsvQqILkyvEtb8
         IirhwWJmVeoGjznKHEkINw8WWGLGZ/+VoIATC+4XZtWT2p0EIdQdDEtTfllEIczqfcgP
         HSTItbM366dQp8zPhg5oYz2/T/aWJ5xfZhyGCKfWsVqRY4uDaZPafF7ptys25LRsAiWY
         zXf20vILXTwV+Va8kci1xRd5SJOtWal3kaEAsuchM4K/AoTYvkL9KbrErABXha7U/U0x
         b7Wg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795339011; x=1795943811; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jlk4MoliGvZW1IkxqxKZvX+OlKzVs5YdkLc7yt4n2p4=;
        b=rSQajXk4yyxPvW6GnUHoTRPWJWDnM+/qTW6hZKO/1BwoSTNW6ekQ2+73Bi/VdKu3mk
         fAwYKpm8YWpXT8EgQ14v0X/aettSCXoyBDG1T9L5ggPnpKXILi4Y+6U4OKb3B59py9l4
         CeNo83RhqEU0GX2vYbM1ANJryPiTSTftVj+KdBOqJ7GPhvHUtvOoDp6h3xc5ecQatPyr
         WQu0rzcI2lbKPCifVkkvoVwKLyi2YMpRgZR1e9l9u+FAzbl/b2+gRji2LRLBwmU66+GY
         LnPiwS/j0iAX/qQTOol7ft2W43LMXHtVpihoVFnSax3j78bDQYBmP0i8udGrMF2RuZQe
         sdwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795339011; x=1795943811;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=jlk4MoliGvZW1IkxqxKZvX+OlKzVs5YdkLc7yt4n2p4=;
        b=ZSqeeASTJNJFXs6xX6qeDAPnVuSMv8M3nRbR0+4DOPfQq/H7gODlUsOgzeukXV04N3
         R9JG06mzXGCMFPu/LQttp+rFzKhvJ3JwkXmczZ9X4A6+YW06t527fkMQk975t9ZaYVSu
         2ZoMB3Gyc/ZaAjwR9J0w4Ow8+LfkjYCCTvBnvSRBzE0ERK73vn53Qvn6vPaRjOvkbiR6
         QUHFx6MbJzKIGWt04y6HDB3uRGChun++WoLO6JMUZJ30M8/5PZViixGRavodsnqynmTB
         p4E6iwdizQSSkEcjmQycBl+R7mIM9nIuIbQ4wSX7Eyl4mKkacNs1CC6TF3NFXMqvKPiw
         fASw==
X-Forwarded-Encrypted: i=1; AL+hErEHQe2Q3AHvhZYMCCGqazcN7OhQsDI5HQPkMo+GnvsyfTqaNFBXd5IP9Ge1+0W8JLMZJda/wXhnPIoAug==@vger.kernel.org
X-Gm-Message-State: APuU4Z/l9tZ21VshwGCA93Bm4npCfAEMCMP/VsYzxEwmx5SScFWyBXKG
	CCLVDJ0vaKTzPJr7Uimet1JBMZMo639StDwvZ+jdFMsyZA/NhFX7FFAcMXsNsGZOpr1BG/jwCNT
	CmwsbopOk1xBzGXFQsZBfj2jFryjpBBc=
X-Gm-Gg: AZFdTZfT1r0SvNweJtV1LsG7wv6ZqxpJWUFomI94fNAJVH4/fuoqK0hTSecMGxVanJx
	0POfIDGB1fs2NENI8DLfyXG5/yjm23752s/sc2/NCtTb5Rh8rLDKDjTDya3pWAWaPlwW2r7N968
	zGA0ASEfVlO/iZSdlefrLRHH9I5QDsoWt1i1GKWxeFvSEtZCrPL0fcmk/kJCy0exuWSjYs1tpgf
	29pinpdtfHxSdlyJJq8dq5a1u+C6udykSZOqwFzcMilz++KZG17e/Y9BGHgFimCOGBr0dBWCdOJ
	CH3r5micAae6AJIBpVTH67A1iZ5FXEIlHPyY0amJRyENJRwJ2RO+1eI3Dm7q2N4ZhyUUPwvbOSJ
	tmPv89+DdILcDDJQTxbpN4bW/24LRqUMu68gKW0nBWdHdWwQbS2nN7YPstSq6fcDnv8QSVbs=
X-Received: by 2002:a05:6512:6719:b0:5bf:ba43:fa67 with SMTP id
 2adb3069b0e04-5c1bc935c91mr2187197e87.6.1795339010786; Sun, 22 Nov 2026
 01:16:50 -0800 (PST)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261119-b4-cedrus-mpeg1-v1-0-aa5ba1192822@gmail.com>
 <20261119-b4-cedrus-mpeg1-v1-2-aa5ba1192822@gmail.com> <1a1f912f033.2efff015191157.7190884739957848478@collabora.com>
In-Reply-To: <1a1f912f033.2efff015191157.7190884739957848478@collabora.com>
From: Arun Iyengar <aiyengar1990@gmail.com>
Date: Sun, 22 Nov 2026 01:16:39 -0800
X-Gm-Features: Aa3M54oE-VNyvNZaxxRREWe_L_ECyiIpVpQf2rmUEBWZs2-DphbG3Q0KscfmLqc
Message-ID: <CAEy9hNVXZvfbW6U=Y7aiONidPKee7npGWpWuR2yQOeUu4aOVfg@mail.gmail.com>
Subject: =?UTF-8?Q?Re=3A_=C2=A0=5BPATCH_RFC_2=2F2=5D_media=3A_cedrus=3A_mpeg2=3A_decode_M?=
	=?UTF-8?Q?PEG=2D1_as_V4L2=5FPIX=5FFMT=5FMPEG1=5FSLICE?=
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Cc: hverkuil@kernel.org, mchehab@kernel.org, benjamin.gaignard@collabora.com, 
	p.zabel@pengutronix.de, mripard@kernel.org, paulk@sys-base.io, 
	gregkh@linuxfoundation.org, wens@kernel.org, jernej.skrabec@gmail.com, 
	samuel@sholland.org, jonas@kwiboo.se, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, ckoever@outlook.de
Content-Type: text/plain; charset="UTF-8"

On Fri, 20 Nov 2026 08:08:50 -0500, Nicolas Dufresne wrote:
> MPEG2 requires MPEG1 support. The new format simply add noise, you can
> fix cedrus with V4L2_MPEG2_SEQ_FLAG_MPEG1 alone.

Thanks, done in v2: the format is gone and cedrus selects MPEG-1 from
V4L2_MPEG2_SEQ_FLAG_MPEG1.
https://lore.kernel.org/r/20261121-b4-cedrus-mpeg1-v2-0-95e4decf03fa@gmail.com
