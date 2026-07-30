Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 497DF3EF666;
	Thu, 30 Jul 2026 09:06:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785402375; cv=none; b=RPWj2ahCaCThTx+j2TYBQDkaHiyQk2g7cMx3Wspdo+mRFaJrAhV+rJ7aPI6Bs4XgRmwdfNNouYVd4o2nT6HhmRiqQXFzVCgjMZkyg78T+gJI5WD0nmfnLtAUnHuzuCKgkkeaGcT257W1gkVlHIjarNQDPASEc2mqyWPdOvGAzKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785402375; c=relaxed/simple;
	bh=3rYZVxLyIl9Jk+BTo4ADPHy48HE2HGPV7aWCn0MLigs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mq+S6exa6Zj6QT0ex6BnlcA0DoDe6ZJ4OKvmAW5ACLm4XAIqTRQ4JAYRqiE3z15WpS+ftxL5LdyE9zI1baqPcPOvCy49mIabJpCCglIATuWfPXX7OHo3qudA7E59lq1PifRSJR01C6/DNcN0qXXgivRI1USb8/lEffaF4gzfMw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UnYRoNIM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UnYRoNIM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F19EB1F00A3A;
	Thu, 30 Jul 2026 09:06:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785402373;
	bh=ecEHhhqOtsUS0lCDY9ZjdKEicoNpZutH/c2m27xLEBI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=UnYRoNIMoV7x83iqE9DVSeUUZQd7Cqs8cL4GDbb4IOfxJk8sd/RWIGMiD5R+3GkO0
	 n7JpEKdFZe8Fsk3UgwNhwz060GR50nq73yYuAqQ0lHUb0V/cwf4tXt/B43uvNqABSu
	 KTfEZmnPcFLms+Uuw5NjzClfOZ3hcK8n0EzIof1Ez5u+fuIxmJy/CXntPAXBfuNR+K
	 n+B2xLyIitrNukAKBpQvi29WrnECuyxJgCGqUUTJEMVPZ2VfQ3mlvRZS8Mmpou/ypY
	 S1JT4iT2kGFIImjNTNfMkqqQI2T/uU+ZvM5Pq+y5R3eHzLjbhQLSOyibGe93qw0bPH
	 Nvji8A982m76A==
Date: Thu, 30 Jul 2026 11:06:09 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Lachlan Michael <lachlan.michael@sony.com>
Cc: mchehab@kernel.org, sakari.ailus@linux.intel.com, 
	hverkuil+cisco@kernel.org, laurent.pinchart@ideasonboard.com, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	kieran.bingham@ideasonboard.com, jai.luthra@ideasonboard.com, Ryuichi.Tadano@sony.com, 
	Kengo.Hayasaka@sony.com, Tim.Bird@sony.com, Kazumi.A.Sato@sony.com, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] media: dt-bindings: imx908: Add Sony IMX908 sensor
 bindings
Message-ID: <20260730-elastic-amaranth-urchin-4b8bbf@quoll>
References: <20260730021525.166811-1-lachlan.michael@sony.com>
 <20260730021525.166811-2-lachlan.michael@sony.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260730021525.166811-2-lachlan.michael@sony.com>

On Thu, Jul 30, 2026 at 11:15:24AM +0900, Lachlan Michael wrote:
> The Sony IMX908 is an 8.39 megapixel (3856x2176) CMOS image sensor
> with a MIPI CSI-2 output interface.
> 
> Add device tree bindings for the sensor.
> 
> Signed-off-by: Lachlan Michael <lachlan.michael@sony.com>

You need to test code before you send it, not with our infra.

To spare you one sending cycle:

A nit, subject: drop second/last, redundant "bindings". The
"dt-bindings" prefix is already stating that these are bindings.
See also:
https://elixir.bootlin.com/linux/v7.1-rc7/source/Documentation/devicetree/bindings/submitting-patches.rst#L23

> ---
>  .../bindings/media/i2c/sony,imx908.yaml       | 107 ++++++++++++++++++
>  MAINTAINERS                                   |   7 ++
>  2 files changed, 114 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/sony,imx908.yaml

...

> +++ b/MAINTAINERS
> @@ -25264,6 +25264,13 @@ T:	git git://linuxtv.org/media.git
>  F:	Documentation/devicetree/bindings/media/i2c/sony,imx415.yaml
>  F:	drivers/media/i2c/imx415.c
>  
> +SONY IMX908 SENSOR DRIVER
> +M:	Lachlan Michael <lachlan.michael@sony.com>

> +L:	linux-media@vger.kernel.org

Drop

> +S:	Maintained
> +F:	Documentation/devicetree/bindings/media/i2c/sony,imx908.yaml
> +F:	drivers/media/i2c/imx908.c

No such file.

> +
>  SONY MEMORYSTICK SUBSYSTEM
>  M:	Maxim Levitsky <maximlevitsky@gmail.com>
>  M:	Alex Dubov <oakad@yahoo.com>
> -- 
> 2.47.3
> 
