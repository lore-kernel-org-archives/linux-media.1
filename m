Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794631816;
	b=F4rsSu8DK3n1bvO/6Nj7pJAg5ZBO3gg4Lc9nmdh//Sgq2mnE5FPCZJGB2sMEo7CsAbgK
	 bZMMEre3U2UPx0Kdm4YLE5fF1/BnS5n0lEL7mJMwPE5xRTbey0yDERYbb9Q0U64j4Icqv
	 9mQOLC3niBlWG8FlNm2BYc0AcgYSPSCovpEFZZy2iYnqt2sHI/X3moSGAbajAGfyMojDn
	 HhDvVkYO/5Zdr3zPhXito6hrhsnZ/Nye/YYG2tBQScaSmLW+fKjX/6O32/xV5zST1JiW+
	 7HDbtLYhzSoJi60ZY03OQd4kFuTMDBYalPJgwXUwPcgX0Ij8KX1D3l8pk4/OHlMIFqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794631816;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=fl1s83XUSSgJEmjMrzHDXuBkyCkMWW9Bq4zRv3Gu3C8=;
	b=N11IBvJy6hGer7QCq2X2Rx/Q6nKv4Y1W3f53hIGpEmXYGy6HhANOiXfGhNza2uWQyxSk
	 iZedGpjHAQ416OtYYVkDbwQiW9/cL+OMAygS1IZ3OZTJt6/jaGSKWykAKPu38mAHTyub+
	 hoYQ0u/y87ZXhxn5jN/6UnjByUBWvIwvefr5RKzPrxyZYIbNBZkbyL7+cIVDJWoVbhugf
	 BBmXd3bz/k/qJkjn4zgHZN7IZOCT26lDUn38ovNgnltII1u3sLoEWa+Hj2J2sb0HzHYq1
	 RqTSWlKWTAm+4RzLCL8/Dwailw1NxZnQ7uDevExH1N8ez+epmnCTo+0ldwRoEZOiwhg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JphtRj7f;
	arc=none smtp.remote-ip=209.85.214.174
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E9C1606A330
	for <linux-media@vger.kernel.org>; Sat, 14 Nov 2026 04:50:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7E9C1606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JphtRj7f
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2edcf6c3a57so2602815ad.3
        for <linux-media@vger.kernel.org>; Fri, 13 Nov 2026 20:50:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794631816; x=1795236616; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fl1s83XUSSgJEmjMrzHDXuBkyCkMWW9Bq4zRv3Gu3C8=;
        b=JphtRj7f3HVMIULAQ8ELkcLLXpYn5oqFJ116GY0ZMR1bKvBPTecqskk4D2jpXcG92T
         EDGrbgMotD340kI6uOr3eO3CWZfJZuE7VAzeEl7/KG5zkNAPJ9HAhNPoh86EoyhhrEXi
         5ZpL2TRGUh98wONaOenjy/2VWbx4uj/v8PlsCVnW4lnZv6dI8c/6qSyqFUmg+mjhwish
         /oIF4xvvSwFMYzydbwEFZ6FW5ADFR1zP1D9aGIltptILATSilRyxWSajaic7xMf0fB5k
         rXDhak7HgctYDlLHw5iuMT1I6VLV0kXDmn3ihKkFC8K1ZneDwr9k26bBsR9wJ08+n19J
         H4Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794631816; x=1795236616;
        h=mime-version:content-transfer-encoding:content-type:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fl1s83XUSSgJEmjMrzHDXuBkyCkMWW9Bq4zRv3Gu3C8=;
        b=aOXkV5PvsT4YlV2+AfTMDxdJvoXbPBOnJV/H0K+IRXOAxLFrTaaDCj53ZeefbrDiTN
         mGcEAjuncIy89Vi3TlZwFTh4MshY71pRTgfIZCkut+8Agh15BNoE9wkt2ABeMpWDP5kp
         YTNSkDG66o7Gb4nJmNcXd/tZylDVhUcwQGaWVmprN88NhJaciJVuGN5SqWr0+93TFK89
         lgWmXOklYtHNC0zXV8VX6OZPendD07XetSRFQ/mUrrpS5KM0uWEBA/zIqi/0a26L636s
         M9aZGrDPLsBBAdkRXu87+7zHpLzWjKmJ0E3ZhgmWy5S0KEuvg/7WME1ftJ8MV/UIOgf/
         eQqg==
X-Forwarded-Encrypted: i=1; AL+hErHiN/orKb09O2JNRsdDF063m5g3632l39svkcVg/5SkQniQ17cTCKxoOJQb73Mt5Bsco7zCzCKV20eNXQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z/kXWUZlbLnDXDjiV7ZSeRdGLogO4HBXOwgLgbqip5KIBUdbrbH
	hY6svKrz8fko0hHW7bRVHVsqBfwoglbzSkTMJcAYgAtCCcVXAMlLHs4K
X-Gm-Gg: AYBFou3iGioJga0v+w8r3fwLaMsHZ3S7SDU3ueyDb7p4Y7m8gEqyaNPoQ35xXT4Pl5n
	wrUz8n7zdZj/ROPAThbp30oMWiOI102yv/nQiukTnfWFKkynKHkH8ojoOineZ0UW6s0OgwZonRC
	A+Ve+c8lHfLTYL21GYL6uWbQ/B5bgyaA9RvFZzE43HFL5jY0hJR9Orre93pPibbWMs6oJTgqBj4
	aVeMbWTXq39977XOiGKNT1m2TNX6r0Va9VEYZEtQYXxqDKlwLYf26knYy6bztFlKYPO7fCskhDk
	ht3uQ7S8UpePZ9bVfZ2qG3nEd40lDJXvIqPPyh5h2lAcS8s1LD7MOFAj+j5b/e9eCDBfj857vyA
	dzsGAgZZFqNdjJDVewxWmEVx7uI5m4RcWwjqzdBz3zHOGUFwXpy/cP1/LTq/rvbA9LovSq7ZTeA
	XdeQ4yAf6W87cvzocVdOxrD5nw7CdK94EhfvEjqKAjhrEH8JC6QFU5AcpuucsBaPtHn5ZJGWets
	8QKrPyRLqlfBYSkvM0jnf3WuvlzfV09dEdmbB0gJXIn8iATnQBTZ8h7u8Sjs+tNdC4l6KluyEL/
	ke5b9RNtCYf2L6GXAuv4Fn05la6ETO9sBr4JM9Nv5EiHOkX4A+TTVHrORgKmQoh2V5yj/mbCtht
	rJziV5Q==
X-Received: by 2002:a17:90b:1d47:b0:3ac:9e76:aa96 with SMTP id 98e67ed59e1d1-3b1b09f966bmr6902083a91.3.1794631815820;
        Fri, 13 Nov 2026 20:50:15 -0800 (PST)
Received: from claudebox.iyengar.cloud ([50.39.139.68])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197d04336sm12649072a91.7.2026.11.13.20.50.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 20:50:15 -0800 (PST)
From: Arun Iyengar <aiyengar1990@gmail.com>
To: Sven =?utf-8?q?P=C3=BCschel?= <s.pueschel@pengutronix.de>
Cc: Jacob Chen <jacob-chen@iotwrt.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-media@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, kernel@pengutronix.de,
 Detlev Casanova <detlev.casanova@collabora.com>,
 Michael Tretter <m.tretter@pengutronix.de>, lgs201920130244@gmail.com,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>
Subject: Re: [PATCH v2 00/17] media: rockchip: rga: Add multi-core support
In-Reply-To: <20260916-spu-rga3multicore-v2-0-23aa2cb74e61@pengutronix.de>
References: <20260916-spu-rga3multicore-v2-0-23aa2cb74e61@pengutronix.de>
Date: Sat, 14 Nov 2026 04:50:12 -0000
Message-ID: <179463181227.3521962.17897555296763209132@gmail.com>
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

Hi Sven,

Tested on an Orange Pi 5 (RK3588S), v7.3 with rga/ and rkvdec/ synced
to the 7.4 merge window, all 17 patches, together with Detlev's rkvdec
multi-core v2 on top of your two v4l2-mem2mem patches. Both RGA3 cores
bind into one video node, and 4 parallel NV12 to BGRx jobs complete
with interrupts on both cores. rkvdec runs parallel jobs on both
cores through 06 and 07 (2 parallel 4K HEVC streams: 202 fps against
111 on one core, bit-exact). No IOMMU faults or timeouts.

One cosmetic thing: the core bound first prints "HW Version: 0x00.00",
probably because the version is read before that core is powered.

Tested-by: Arun Iyengar <aiyengar1990@gmail.com>

Arun
