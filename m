Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DCD1329E5A;
	Thu, 16 Jul 2026 08:19:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784189954; cv=none; b=B38/z6KCTsIC01/uQsQxf1kMsz6J26qxyoO5yNGmTo4zZHoM0Sz+7nZlx+1itmQQEZN12WwtnZNFN75r+2Iwt7bxUQLvN07M00QzAigTF1cbfzPP4+M45p7VLIHTw+F4N0B/3BAPmTwhoYySGNNjKpiosb583H4+p3IL/F/wKVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784189954; c=relaxed/simple;
	bh=ssrBMW46VQIVcwyYOLSpAIFq/YRzLaGeov84JRUwx68=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mrT5ymrVoigdrVdEARDZLGF9zAfVpRbDUvHzke/CIyO59mQUaAQfsaS+kuNnZbDnxotshM0UNE0qF4qDB9OWdVDY/w/PzltjuN1qB/POHviZPf51V24G3lta6HSU+m8gPZoOKVrdcoevnsHwVheGhkbumB0ggk/E3vV58pg6XeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dFyC/2yY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dFyC/2yY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 497E91F000E9;
	Thu, 16 Jul 2026 08:19:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784189952;
	bh=b3GqK/sS1IxpozlDNYd0Q4Ov3M/omYleZPDCK54NcwA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=dFyC/2yYSQYkB+Eqz7BImu2eWGJAPn9FfsmcN456OTz004CHdjpji/N+vZ2YNpWbb
	 sUP42c1C4XD7nhQw5io1qAzaxCPQ1gL1XX5Gh1S/jCxs2WMb+Nc0ID+uJ+XGRZGcM/
	 MdPQueYjM3VQXuj2RqNW+adKYpIdnrG7YEapAqepEzwrDpWjWZjyX9UVyM9CWO07+c
	 eQQDisqu+k4xGEj0QC236fPwNsZfrFdLWre7YjiqjAB6kH6umsM7wCUNXJBLtIpzDa
	 /Sn5yuZyIr9dSVHLn6WchyakjQpppYvK11tNktlu/UomlPO/L2wr+Qsuh96AdTI1vV
	 fydnEzOEp3EqQ==
Date: Thu, 16 Jul 2026 10:19:10 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, Naushir Patuck <naush@raspberrypi.com>, 
	David Plowman <david.plowman@raspberrypi.com>, Kieran Bingham <kieran.bingham@ideasonboard.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
Subject: Re: [PATCH 1/2] dt-bindings: media: i2c: Add imx708 image sensor
Message-ID: <20260716-devout-papaya-kiwi-1cac62@quoll>
References: <20260715-imx708-v1-0-1f36f54e14d4@ideasonboard.com>
 <20260715-imx708-v1-1-1f36f54e14d4@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260715-imx708-v1-1-1f36f54e14d4@ideasonboard.com>

On Wed, Jul 15, 2026 at 11:01:28PM +0530, Jai Luthra wrote:
> Sony IMX708 is an 11.9 Megapixel CMOS sensor, that can output pixels
> over MIPI CSI-2 bus. Add bindings for it.
> 
> Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
> ---
>  .../devicetree/bindings/media/i2c/sony,imx708.yaml | 120 +++++++++++++++++++++
>  MAINTAINERS                                        |   7 ++
>  2 files changed, 127 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx708.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx708.yaml
> new file mode 100644
> index 000000000000..bc346730e1f3
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/sony,imx708.yaml
> @@ -0,0 +1,120 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/i2c/sony,imx708.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Sony IMX708 Sensor
> +
> +maintainers:
> +  - Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>

Drop, no shared mailboxes for bindings.

> +  - Jai Luthra <jai.luthra@ideasonboard.com>
> +
> +description: |-

Drop |-

With thes two:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

