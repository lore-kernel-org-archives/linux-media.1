Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793909235;
	b=ZoRnb8Pj6uRAnAgJAbj+wX1YWBVLVZc9ijbwILpX7L+9lC9nbegmvrk1rE3xt1N43tfl
	 AIs1AbGwnkPkISnVeLCOI/rJKBPe8R3alWC2hPhSe9qr+oPztnkbCaq5aOD55v9nmTeN6
	 FsUWe1Cu2mUOjNjw0Qewe7jSnsKQwhYog9rCD6niRo3SBAmi+ztS1bvl9uNxlKASfA3pe
	 WSQYF2cdwb1ki3ovmDcCr3f08rKJvfdYcKJONtDPXt9+jV+o8WPFHqPpy3in0mBPg8Vai
	 mVnjs6iXqELyRludSorDKdTVTkKEuHmwwBtkCus2O5GK5/Z59RvggokGRk2e/yueiyw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793909235;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=dCmDJGQnLkybuK/FNJb9oTUo/DUbc0oZdDzO8vpbYhI=;
	b=nTY9Uhd4EXKKXJaydfGZWO9fA4CLbqZdJDwX+K3g52FGToIYCTA2j9GuiW8Xt5Kr6xTh
	 vkz0XOl21+5UEQuVLKMWfU/FnGIzWrtziB2pgcqpt64egEYql5sRHtgb7/1Ns5TWqBA30
	 oOcNjJjxlbo+9Cl/V9rebjkc17ktaQwPsp50GrVk32P9Ey+UnX4IDweRSkc/W5A9w+YYX
	 VfgvxVKMe3QQDjLNR4VRzC2wswU4uVMxGC+/p3fNuQqKkvS5UDV+CBJl4q+vjsC6E2pjx
	 W4/3Me7fj3Oi3voF5pyNlmFo0vacqrQjehtO/zqWa0ZSn53pHhTCUtVYOXt3NQHatgQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="NdL4j/Sf";
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA7B3606D812
	for <linux-media@vger.kernel.org>; Thu,  5 Nov 2026 20:07:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DA7B3606D812
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NdL4j/Sf
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a210470b49so17793795e9.2
        for <linux-media@vger.kernel.org>; Thu, 05 Nov 2026 12:07:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793909233; x=1794514033; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dCmDJGQnLkybuK/FNJb9oTUo/DUbc0oZdDzO8vpbYhI=;
        b=NdL4j/Sf2euHzhcOElIVGfgvu2LhDvenH5bjqq2qaHGaLaIrdyqsOm9TpNX6ft8WhM
         8NKw4opLm/USQ/0OAmiYO/NLb42AVD0JtX68uwzpOHYajR8dsA3ekVp/nvz2T+mFA+Q+
         EoQzAuYrldZcrCCfET5NNuGy3OQ2/6TjKivZN5TAdW7jsmy1T1OQnWV1y7wTr59/qosA
         I8syR2ByaOSihh+UAI31e5TJPH58LGuTTt+qckBr1oAntXuGGIGWmYSPzdkGui4QHCFf
         a1G4ifcX9f0eILhcRlA/hA5aE9cn18E/zl3GBXib0bSdw0fw2XZQVPSa3AYLsKr1xHsK
         Yknw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793909233; x=1794514033;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dCmDJGQnLkybuK/FNJb9oTUo/DUbc0oZdDzO8vpbYhI=;
        b=oAmDpFP33dEdf7bddRddZAJPY/sZkVZvUfIiFJhzmfsa+4o6sdC3Wvajtk7o9qO16T
         3PnQkt44M21bOD8qAesxvygjSVRDbORxLBZMwQMo0Mcx8AeP96UYXrqUpngCW6hS4UCJ
         sLXQ5ubte6nLL9MIj5WiQyP7AvOgzY2fZPQNHVabXUkdP5W8ZWSCJh+W6OcM8vc/fhM8
         je7HqrrqmCxpkudD0/+kN7uVajv4Rk6ZWCjKFWnFbdpTQvhWRc6t3z5WnMWGTh8Le0Cx
         zjwsi/Wx12MSWMYgj10ocmoBTs5Bbk4sOteSCWa+s1L8i1PQxwbhGatqaV84Dj6G3uVm
         NlVg==
X-Forwarded-Encrypted: i=1; AKwUvBw99kwTmXjaHOteb2maBxfNRqAzvJ6bKHl4nXTgwHBAy4ei4gTzMZTBDE5O3ygtghScInZA4UEyz3rCGA==@vger.kernel.org
X-Gm-Message-State: APuU4Z9OoVoX9z0UlD+A1OLVBc2PMzT74Ajdqzg/Z4VqALqboJoOUHja
	l4NAeydZ2bCuFKNMwCw5HCKlxs5toSGwzyBajohbjLly1do3vouY22dL
X-Gm-Gg: AYBFou1bhwPa569fFz647dszKQz/FmKFGWAC0DLP1N+wl6dpdQRnx3Go1H8WzmGU5Nw
	dQb4ofwU7OeDYSwnwFivAYraf/ZcD6CKY4VUmZ325K6SpL7qlkv/jsQvSI5gp3ATWHkJ/8bUntQ
	6k4MPPTWOLMhthxsiOeOpIc7fnZx2ES7G3638oM8FN0J1A0b5jro9QjDInMYcqTYdFE8/5297He
	poTW+07GvTZo6Phf8GMCg4sYywltxuR4chaFZ/OeoZO24obP4ffyvLwjBpc/NdGqJWWK6Fp2z4t
	YT/VcwOH6YE0D8YcWrlHc79q49I9bCNiBOMliNKiJq/265uMdkLPpGJQhlq/zazJubw4LEcW6Nb
	RisHJIpsYtqrIs1twiXjk9CsTpmFoPpTmVRWiX5B6SNZ1Yynht9U1/jQDXptyZVswMGn2UFbyVK
	XdMZLWIy1JFSq3/wxgZXMk95pJNq7qDU5qjftKKp+8/h/q5JJJgMaWNggAGjRa9qJUR14bDYg6G
	qV1mtFMY/ddxWF2wpADhm46wtbdIFIR11kyuZfrZz3etZEqeQovHF8kDUspALoUekpTwqjt5PYg
	mQj06ztTKsmOFGnki9hLiRSj1bAEOABPQDVxTWcQu1MlF2YQgkJVfd4u0h0=
X-Received: by 2002:a05:600c:1d26:b0:49f:fd40:80fa with SMTP id 5b1f17b1804b1-4b6dff86444mr3062505e9.34.1793909232668;
        Thu, 05 Nov 2026 12:07:12 -0800 (PST)
Received: from antoniarch (78-212-29-45.subs.proxad.net. [78.212.29.45])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b433ebd278sm131671835e9.3.2026.11.05.12.07.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 12:07:12 -0800 (PST)
From: Antoni Pokusinski <apokusinski01@gmail.com>
To: vigneshr@ti.com,
	andi.shyti@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	aaro.koskinen@iki.fi,
	andreas@kemnade.info,
	khilman@baylibre.com,
	rogerq@kernel.org,
	tony@atomide.com,
	jmkrzyszt@gmail.com,
	sumit.semwal@linaro.org,
	christian.koenig@amd.com,
	phasta@kernel.org
Cc: linux-omap@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	Antoni Pokusinski <apokusinski01@gmail.com>
Subject: [PATCH 0/3] i2c: omap: add support for DMA
Date: Thu,  5 Nov 2026 21:05:51 +0100
Message-ID: <20261105200556.34240-2-apokusinski01@gmail.com>
X-Mailer: git-send-email 2.56.0
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

Hello,
This patchset introduces support for the TX & RX DMA transfers in the
am335x/omap I2C controller. I tested this implementation on AM335x 
(Beaglebone Black) and things seem to work fine.

Kind regards,
Antoni Pokusinski

Antoni Pokusinski (3):
  dt-bindings: i2c: ti,omap4-i2c: Add DMA properties
  ARM: dts: am33xx-l4: Add missing DMAs for I2C controllers
  i2c: omap: add DMA support

 .../devicetree/bindings/i2c/ti,omap4-i2c.yaml |  12 +
 arch/arm/boot/dts/ti/omap/am33xx-l4.dtsi      |   4 +
 drivers/i2c/busses/i2c-omap.c                 | 291 +++++++++++++++++-
 3 files changed, 303 insertions(+), 4 deletions(-)


base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.56.0

