Received: from out-183.mta1.migadu.com (out-183.mta1.migadu.com [95.215.58.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CD4042047D
	for <linux-media@vger.kernel.org>; Fri, 24 Jul 2026 10:20:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784888411; cv=none; b=KKRS7IarMp3z+RuTU5p3QOzpGjhBiC5VFC7bsLiMOyk+Venx/dqLLwL2Dw5p4d364EMIdoIsGUmbrXMwXW4CA1NGhRynrI9KvryNY0vpF/1Ve6xq8O4dcXZJBrOh1NcO1gFq5P28IbPEdNEB7xie82W0E7hqEd4LjRhzKZnEOA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784888411; c=relaxed/simple;
	bh=43loBfQY/YMXr6zeV9pXCVAF0ZfELGRn5ItUjZRXuLQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:Message-ID:
	 MIME-Version:Content-Type; b=oxPEk9YuMZl1TelWKU8kyoBh75ybjawOJgE9b6e4f1k+mlYQ/fKc6mBwVXTakjK7TqUATFwtN0aZYApjDKHhwROhxHlSXWgL0C3BCnPixBsO/y9w2fHr07kGmLPoePhOlCzRJXgvu3HkNUjzzsFF3TCDmkURyFUEPg8f/c0kPuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org; spf=pass smtp.mailfrom=postmarketos.org; dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b=cKwoBgnE; arc=none smtp.client-ip=95.215.58.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b="cKwoBgnE"
Date: Fri, 24 Jul 2026 10:13:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1784888396;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=k4jA95NvxlnIR1Hi2g9Z6FkmE9n79P+Ej5d6GEWovXQ=;
	b=cKwoBgnE+DhdTJU33w9R9euhKma7trvL516xwdFrdSR280gx3pYzmYPoL2PzO6zKg4lL2r
	dXR5nwK2R6UctttWiJOJDOtg2Sm/nRqZo1Tt5c2TZB04ZfQJ/K90Z7XDJXjzFzrsHxK+3a
	Z3TnFQWnO6jfg05+Gc4FrGCA8hgPGJzaYI2QSvfYRUZhKHnvUAqVMGggj7RhoTdFS9r/WS
	VyzzYyLKEYOy8x78w4xTGLIiq6P2Pp+aaPkDjXuZmnwxw1J8AOJDZGnW4nxsBUoDN+ns5K
	zI9qoPXU6n5j8jAKW20dD9+fsMcLSEuvTnFrnW7G3Lne3gCPK8cQUukJvHlCRw==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Ferass El Hafidi <funderscore@postmarketos.org>
To: linux-amlogic@lists.infradead.org, zhentao.guo@amlogic.com, Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, devicetree@vger.kernel.org, Zhentao Guo <zhentao.guo@amlogic.com>
Subject: Re: [PATCH v6 0/6] Add Amlogic stateless H.264 video decoder for S4
References: <20260724-b4-s4-vdec-upstream-v6-0-6072a7ee7428@amlogic.com>
In-Reply-To: <20260724-b4-s4-vdec-upstream-v6-0-6072a7ee7428@amlogic.com>
Message-ID: <tiocog.2cefvi325on5y@postmarketos.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset=utf-8; format=flowed
X-Migadu-Flow: FLOW_OUT

Hi Zhentao,

On Fri, 24 Jul 2026 07:04, Zhentao Guo via B4 Relay <devnull+zhentao.guo.amlogic.com@kernel.org> wrote:
>Introduce initial driver support for Amlogic's new video acceleration
>hardware architecture, designed for video stream decoding.
>
>Compared to the current Amlogic video decoder hardware architecture,
>this new implementation eliminates the Esparser hardware component,
>enabling direct vb2 buffer input. The driver is designed to support
>the V4L2 M2M stateless decoder API. The initial phase includes support
>for H.264 decoding on Amlogic S805X2 platform.
>
>The driver needs to work alongside with a signed firmware. The loading process of
>the signed fw is as follow.

Is the firmware still signed on devices that do not have secure boot
enabled? (which means none of their boot chain is signed)
Do the signing checks take place in BL32 or elsewhere?

>Stage1: Decypt and decompose the full firmware package when the driver is probed.
>  +---------------------+                        +---------------------+
>  |  Decoder Driver     |                        |  TEE Shared Memory  |
>  |  (Kernel Space)     |                        |                     |
>  |  +---------------+  |                        |  +---------------+  |
>  |  | video_ucode   |  |                        |  | firmware      |  |
>  |  |    .bin       |  |  Copy payload to SHM   |  |   payload     |  |
>  |  | (from fs)     |  | ---------------------> |  | (Secure RAM)  |  |
>  |  +---------------+  |                        |  +---------------+  |
>  +---------------------+                        +----------+----------+
>                                                            |
>                                                            | PTA Invocation
>                                                            v
>                                       +-------------------------------+
>                                       |             BL32              |
>                                       |  +-------------------------+  |
>                                       |  | Decrypt Firmware        |  |
>                                       |  +-----------+-------------+  |
>                                       |              |                |
>                                       |              v                |
>                                       |  +-------------------------+  |
>                                       |  | Decompose the full      |  |
>				       |  | firmware pacakge        |  |
>                                       |  +-----------+-------------+  |
>                                       |              |                |
>                                       |              v                |
>                                       |  +-------------------------+  |
>                                       |  | Store decomposed .bin   |  |
>                                       |  | in Secure Memory        |  |
>                                       |  +-------------------------+  |
>                                       +-------------------------------+
>

Is BL32 strictly needed to load that firmware? I know on at least older SoCs
(sm1 and older) BL32 is not required for booting and amlogic-based SBCs are
often used without BL32. So once this gets ported to older SoCs, would
it have a hard-dependency on BL32? And if yes, can upstream Arm Trusted
Firmware-A BL32 be used instead of the Amlogic blob?

Best regards,
Ferass
