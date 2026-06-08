Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3652835E1C5;
	Mon,  8 Jun 2026 07:02:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780902140; cv=none; b=hi///6qxdDUqXOfeCLirCi9Ex1AbBJvA0XRDaK0IftXbRc1F/GPyyYSKr1V6sFQBNfQW2NGfBQp8qKxZDEew9EB/3FsUcKqf0VLbSqTlnlwaZPCZbmGN7Fso03yi2hJ13jB/xG7X9+CZOKBAaYm1fLZpINxWttOxFYvXsZ/2FTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780902140; c=relaxed/simple;
	bh=tZrj9eLBvzRRcM6HT0FeOdIB8ecGY5WrVP53mjUljls=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ooodsiEmFt4o2SAbi9ivKs1OrWv1UFSVgqU0Ya9vlubiNBZT8CkZBP7WwUCQVh1CXoVjCDZNPD5Zh2iteKaCFwGS25CakMyk+L6LjByvjySKwSQx/qLutIR4y6hlXwLsiag3lRy+Orbpux2xtld0FpuHlgkeGmrIMgap1w8FC7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nBS/7M4C; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nBS/7M4C"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F5D71F00899;
	Mon,  8 Jun 2026 07:02:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780902138;
	bh=XHHLj5Mh1orkQVPCuQezuHasEYiWXohNYryPE8VxcMk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=nBS/7M4C2ph6rkZ6DDBV7/vdGjFODsZV8yyjFfDFgInQPp1jvJdUWtdOgwvL5iM3/
	 6GiDX1U+acRP2mjUn9jVMiSHOProAzGoTeChQbFPpjyW9MafSFRYb1BdliaD4yPQJM
	 8MCgpcE+LejdaYK4MQnS7t2UcNsGvHaO3iA6bZhASjutdivwEjc8eQfrpIOfyUwd4N
	 DGLBMC8KPUGjNsaOCrw0cQrs/V+cn9b6IQe2KgwJKcpV0HJZ5Ml8V4iV6u9hnbFBqA
	 ZsYHWukLkNIVEKyWBaHrPLsPgkbvN9bjWvGlY1tKkIDh4ToS/87wdcfHU2aWu2dZ+w
	 bX0QrjferTosA==
Date: Mon, 8 Jun 2026 09:02:15 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Herman van Hazendonk <github.com@herrie.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 1/2] dt-bindings: media: i2c: add aptina,mt9m113
Message-ID: <20260608-nondescript-organic-jacamar-fc2ac9@quoll>
References: <20260607-submit-media-mt9m113-v7-0-5da397a3d2a5@herrie.org>
 <20260607-submit-media-mt9m113-v7-1-5da397a3d2a5@herrie.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260607-submit-media-mt9m113-v7-1-5da397a3d2a5@herrie.org>

On Sun, Jun 07, 2026 at 07:34:04AM +0200, Herman van Hazendonk wrote:
> Add the binding for the Aptina (now ON Semiconductor) MT9M113 1.3
> megapixel SoC image sensor with on-die ISP. The chip is used as the
> front (user-facing) camera on the HP TouchPad tablet and connects
> to the host SoC over MIPI CSI-2.
> 
> The binding describes the chip's i2c address, optional reset and
> standby GPIOs, the per-supply regulators (VDD, VDD_IO, VDDA), the
> external clock input, and the CSI-2 endpoint pads exposed via the
> "port" subnode.
> 
> Assisted-by: Claude:claude-opus-4-7 Sashiko:claude-haiku-4-5 Sparse:0.6.4 Coccinelle:1.1.1
> Signed-off-by: Herman van Hazendonk <github.com@herrie.org>
> ---
>  .../bindings/media/i2c/aptina,mt9m113.yaml         | 122 +++++++++++++++++++++
>  1 file changed, 122 insertions(+)
> 

Please slow down your submissions. One patchset per 24h.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

