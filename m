Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE603381B14;
	Thu, 21 May 2026 10:22:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779358980; cv=none; b=G1mcLuTYWuTTqlEUOyo5Tl4wZ61OTVdAadZgh6EatxTxAuPtP9JE/3dyIWeTZSTVG0a+L/ldhCtodjr/eS/juhVlTfsNvtfj8SVw9pKf4CsXOLvb7v3ZPNOePTLYC5/2sgHnxiC+5rZkwN5C2qcfP9vZMCJkqX+Z18sbyPhTIwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779358980; c=relaxed/simple;
	bh=iH44MQBXY+RPkN1/pNTfTr/XPWCK8ELtzT9+zTyUGVs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LbSQxLtIaq3IaHbGUSuN+sr40GBtrvE3tCIRLbLq71CfKPwVMGUh7wvx1zoqLHpeKqYar5z8M35SkZ8Ux7mbLk2RmPgBigciR/SCpISZ3OC0yeBQn01y+lEstAU5fFRCD/i1gYnE4EkclrFyZ9KWPT8DrH4bfuXl1D+nlLISur0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jrtP0KOo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jrtP0KOo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09E161F000E9;
	Thu, 21 May 2026 10:22:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779358978;
	bh=tr1yUHkv21PEkBdMeiiv2LlGquynu4i8jWIqnuMI3R0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=jrtP0KOog2tqfl3KQSiBIETsyv79Rc+c2PUbgVYj8Dukdu63s5xVaYEUCJznhUSQs
	 ExpgOD4ptjeAhZqEylPax3sSiUhXEgdvR+j72ZE0KyRHH/CgMblyT2uq0412+1LDso
	 ++TzEKHHV0q9Nv3HwJXJad5JIye9GsA8slGQ8oig6BUzeOZUew/guwg9rM0lZCX4qP
	 +n3lOqXKClWBcRNLKKCM5JUUGVa9Tb4BAVmK5NDg7nClZAECH0EuUg6w1LZdNEaEZr
	 y1ITPoQShhgXO5faYQ11eteUKIjURT9+epKmpYpaNLMoGJcZFD8OKt7cXgTu79/Dm0
	 5E70EV/S1wPdQ==
Date: Thu, 21 May 2026 12:22:56 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>
Cc: sakari.ailus@linux.intel.com, 
	Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Hans Verkuil <hverkuil+cisco@kernel.org>, 
	Hans de Goede <johannes.goede@oss.qualcomm.com>, Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
	Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Xiaolei Wang <xiaolei.wang@windriver.com>, Walter Werner Schneider <contact@schnwalter.eu>, 
	Kate Hsuan <hpa@redhat.com>, Svyatoslav Ryhel <clamor95@gmail.com>, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: media: i2c: Add imx576 sensor
Message-ID: <20260521-adept-lorikeet-of-elevation-5fceef@quoll>
References: <20260520115641.11729-1-himanshu.bhavani@siliconsignals.io>
 <20260520115641.11729-2-himanshu.bhavani@siliconsignals.io>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260520115641.11729-2-himanshu.bhavani@siliconsignals.io>

On Wed, May 20, 2026 at 05:26:33PM +0530, Himanshu Bhavani wrote:
> From: Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>
> 
> Add bindings for Sony IMX576 sensor
> 
> Signed-off-by: Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>
> ---
>  .../bindings/media/i2c/sony,imx576.yaml       | 111 ++++++++++++++++++
>  MAINTAINERS                                   |   7 ++
>  2 files changed, 118 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/sony,imx576.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx576.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx576.yaml
> new file mode 100644
> index 000000000000..b74253004fae
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/sony,imx576.yaml
> @@ -0,0 +1,111 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/i2c/sony,imx576.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Sony IMX576 Image Sensor
> +

Everything looks the same as imx577, so just add it next to that one. No
need for new file.

Best regards,
Krzysztof

