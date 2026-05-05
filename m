Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCCA648BD3B
	for <linux-media@vger.kernel.org>; Tue,  5 May 2026 16:12:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777997525; cv=none; b=FGQBtollt6H+wExKXE3Pzp+Sj9CVGVGqwP7TH1lSbiSBsHPH7adcKQFeckOo6FeHX0M4fkK31DmAWRd2u4V88+NxSRLP94Qy2yJ1opX1eLiQJj7DtYTFjSnkBVkurSYLbVFp/ueca4DppkALFZvyfcnTQuZQMKVzVS1PAFx0kAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777997525; c=relaxed/simple;
	bh=/2YwgXM9F3f1htySNFFwNXvypiZD27bWqqyQPFCwZo8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=InO8GvWBLXsV0GPxTh3AfnDr2TqvB7AI89qvMbb+6nAZCi5RXp99xABUfaUBupQIelMIGdPzd7edSAnYEtRcq7FCr1uHmow5270mE2Vk4zY1q0I5vpHR1VrXpZIVk8Lxz3SpTIYY01TU/uEc71M2b+ISltJLxRiTS7+kpKwDwLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QE0Jzfr4; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QE0Jzfr4"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4852a9c6309so44192275e9.0
        for <linux-media@vger.kernel.org>; Tue, 05 May 2026 09:12:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777997522; x=1778602322; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/2YwgXM9F3f1htySNFFwNXvypiZD27bWqqyQPFCwZo8=;
        b=QE0Jzfr4ghC+sfz3pY6AwdkOy/JkB38i5QfaYsWWqBiaQC7dbrCwqAu1tuMv2lQ0II
         Osz/LZPWzhFMpCbjvBr9dSfXGb+osmuomdhRvAQ0xJP6DXMQK85vkkZGKMjKxeII88Y+
         P5NjmTNhairu5hV8QlgC/wQQj3/V7AEKUM7uSoFSTePMWC48J+EIeaZUI+FPLuuQ/4hj
         7mKZYr3Zz7QEWQZXlbc0+Wx8bQCHwWU68BIwXJ3hDsNace1ah9IhoPXnsmD2zQPbBtAQ
         GKxYlK/WCgf2QfOgBubpQv/TrcFaFvkn6eXPUXhzjxmSugsdRMfBAr+LBupBB4YgfTgm
         NLug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777997522; x=1778602322;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/2YwgXM9F3f1htySNFFwNXvypiZD27bWqqyQPFCwZo8=;
        b=XVJ1ub4Dxr11x8zBibS0oKBOthww+/j6nfonHWhKvlDNYMt4PG3xMntpDWohx2cb12
         epVvVEqifvLAjiB7O4sMZTmgyPcIf0EsLnaAGaPGg99ed0ZDHdONJpNxQ7ZlNHYDIPk9
         9G06GZvQOJt/wS88JOFMH36Ttcnx6DPiiM/SzT7St/9guKKvURhwXGiLEEnQWeAqzHw4
         EloFsChtuJOKHZoV5vcE6sax8OEYdgcUoFq6Fg5iv4q4vUL5OBNuNl7zeOTEg+HWdZaX
         8cHVyTLHtWcYKuc/T45ygbmi7WO6ay70tdxqTS8JthnsqHdfYr1QWyxojyJ+HjkJpwVn
         i7gQ==
X-Forwarded-Encrypted: i=1; AFNElJ9wy3YXwnbh9IvZVY80FV9ya01pxPiPibBBnfsU1VHMHZhxKDOif9Oay1Dj9x9rkqrEYSIYzhURL5cbgw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyabTMmJGqFi2xs8JETqrUESgXZTWA/HKnzhP8W66w5JBOWQcii
	+G515a2tYbk44yAkInwUQvnC8LF8SdQlddaQFTZZXEa4KkoK+RmBw0Ir
X-Gm-Gg: AeBDiesgBr+hwyesd4Ylh2zwMjN1zUzJq2sB02nHF2mHYYETzPohfF89zWL3lZYzm7i
	TorIRvtP0Xi+0pxfpBCmmd6ZwWEV5bW4s3Q65ZCGt7ZTzwj0l/k3agrk6mXQf8od+uzld73WsoL
	6QDzAQ/izU0KlDWIQLlQSTU1pGFS1kbYE5M5sOSj4nMV34gxEb123benl+yBqg8xg4ZYReviURW
	qXb9o5BSTPukoZYtd1eZaZKElksfXa2GcmUI8lug/V6toDhmJqR87sjLcocl14XIfPl2OgaWBOR
	jAf0OBityu42GTNSEHyoBPVzkvzT88SMbDlK49+mTI/CSKLinYIt3PjcHtviERELd96DdreKHmL
	5YQb/QtGqpjZsXSAtm0SiihGMNCeForqaP27SXUQ+Way5s79pIrzqgYnbd/pcUMZWkXkofWVo0h
	Tz8OpduLGreUc12pOi2uiCKOiLg1tE92q/N6eFM2SOfYpyKGqrZrBitttV+f8+tN3OhUUUY/PCI
	Z5XXreJMf9iWNsjzjU=
X-Received: by 2002:a05:600c:4506:b0:488:9e43:9690 with SMTP id 5b1f17b1804b1-48d187daac6mr60424265e9.10.1777997522093;
        Tue, 05 May 2026 09:12:02 -0700 (PDT)
Received: from jernej-laptop.localnet (46-150-62-216.dynamic.telemach.net. [46.150.62.216])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48d17710bfbsm26884555e9.7.2026.05.05.09.12.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 09:12:01 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Maxime Ripard <mripard@kernel.org>, Paul Kocialkowski <paulk@sys-base.io>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
 Jernej Skrabec <jernej@kernel.org>, Samuel Holland <samuel@sholland.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
 devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH 1/7] dt-bindings: media: sun4i-a10-video-engine: Fix IOMMU count
 for H6
Date: Tue, 05 May 2026 18:11:59 +0200
Message-ID: <VwMu5tg2Q9-HLmYXaV-qwQ@gmail.com>
In-Reply-To: <20260505134812.408316-2-wens@kernel.org>
References:
 <20260505134812.408316-1-wens@kernel.org>
 <20260505134812.408316-2-wens@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne torek, 5. maj 2026 ob 15:48:05 Srednjeevropski poletni =C4=8Das je Chen=
=2DYu Tsai napisal(a):
> On the H6 SoC, the Video Engine has two memory ports, thus two IOMMU
> connections. The secondary one that is missing is likely used for
> reading reference frames. The newer H616 is the same. On the other
> hand, the D1 only has one memory port.
>=20
> Add the missing IOMMU connection for the Video Engine.
>=20
> Fixes: 62a8ccf3a248 ("arm64: dts: allwinner: h6: Fix Cedrus IOMMU usage")
> Signed-off-by: Chen-Yu Tsai <wens@kernel.org>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


