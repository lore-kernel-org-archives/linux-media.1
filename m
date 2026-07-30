Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3E9738330E;
	Thu, 30 Jul 2026 03:24:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785381892; cv=none; b=gV3GfWV6M+TensmW9s5wNn1WO5LlOkm6NWB2+aA41vfq+eXsqksICtXmoOTvx7Iy5lLQ3PkrSDfU1iUggErrdnbDzAFBNdinJPPuPiUxGLcRk/ee7HTtHjvyyLBYWRf0DDbvj0rLhuUlJ+UWwKjs1rDrd85ut2c1fB/2Cr7dIu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785381892; c=relaxed/simple;
	bh=dfOwjE6/qxPUgdbNvlCj36eqbriujMXnWmMY+0JKEOA=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=aTzyxP4/VJGMBvwVwKrX5sMgXoyVnMeqhHXG8X4EzCwNcL9DowglYiD3OUXqLH8lsKshvAcWL+LQUbooUpRRRjiMA5pOukJ16uzbWlQSdzmnEaJ0CqG904N0AIof71v4g0kuajfsetNoumZJCgGXXmUUPX/SOzcj3TBqzYQIJQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ju4k/2TF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ju4k/2TF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1ED071F000E9;
	Thu, 30 Jul 2026 03:24:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785381888;
	bh=D4TeFTh7418AFAFB7R4NdaEQ7MqYQzhqX2x3zq3E9fQ=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject;
	b=ju4k/2TFNygb13cGajbxLuZk49bOWOrpcYVKtC1SQcGPiK26UzysyXtd6MusI6YoB
	 m9mRO7/wy403CNKaMeEZZcfmmhpQXq0qdRsXiOUyIBUrzIzNLzWB+6puTeiWZSph5i
	 dheguAH8UuJnDTF2mk0p39yaVAjxvbdPPfUSrYALa8OZFPsrM+06ho6HTwqWV4Hio9
	 lBpYRHUjN8BuwbwbtX5uwgACa41EoRXHtVUEVzvAMqCQLAlrE1GyWZ0WjvNLEJC9Sx
	 78wlf13d5EfytaGGPFiF0Z0k4z/s5HunNBSJG5U4WBuBUm3vfbgYojnQW59Jnj55qI
	 MvxUTLKyygjHw==
Date: Wed, 29 Jul 2026 22:24:47 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: conor+dt@kernel.org, Ryuichi.Tadano@sony.com, Kazumi.A.Sato@sony.com, 
 Tim.Bird@sony.com, Kengo.Hayasaka@sony.com, 
 laurent.pinchart@ideasonboard.com, kieran.bingham@ideasonboard.com, 
 mchehab@kernel.org, hverkuil+cisco@kernel.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, jai.luthra@ideasonboard.com, 
 devicetree@vger.kernel.org, krzk+dt@kernel.org, 
 sakari.ailus@linux.intel.com
To: Lachlan Michael <lachlan.michael@sony.com>
In-Reply-To: <20260730021525.166811-2-lachlan.michael@sony.com>
References: <20260730021525.166811-1-lachlan.michael@sony.com>
 <20260730021525.166811-2-lachlan.michael@sony.com>
Message-Id: <178538188735.687855.723192459287079231.robh@kernel.org>
Subject: Re: [PATCH 1/2] media: dt-bindings: imx908: Add Sony IMX908 sensor
 bindings


On Thu, 30 Jul 2026 11:15:24 +0900, Lachlan Michael wrote:
> The Sony IMX908 is an 8.39 megapixel (3856x2176) CMOS image sensor
> with a MIPI CSI-2 output interface.
> 
> Add device tree bindings for the sensor.
> 
> Signed-off-by: Lachlan Michael <lachlan.michael@sony.com>
> ---
>  .../bindings/media/i2c/sony,imx908.yaml       | 107 ++++++++++++++++++
>  MAINTAINERS                                   |   7 ++
>  2 files changed, 114 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/sony,imx908.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/media/i2c/sony,imx908.example.dtb: camera@1a (sony,imx908): port:endpoint: 'remote-endpoint' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/media/i2c/sony,imx908.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260730021525.166811-2-lachlan.michael@sony.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

