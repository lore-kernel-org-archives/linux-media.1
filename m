Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 633AC35E930;
	Fri, 24 Jul 2026 05:59:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784872755; cv=none; b=C4+93cR9Ah4fDCYHBPmbAoS5vOK3wMI7Luwz7ODkYLCgECXjLh+URRtal4shj6a/+RXk9ZCeeHGLQEn7+hsRloDah18BOISLxG4G/4f7SxC26leZzqruYD35g9MVcSwXIKVeP3nAoTC9032VphVRIckGsR0i3k00YdAtLlm+nW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784872755; c=relaxed/simple;
	bh=FGQhwCamz7+tMX2WnlSloMAu2AXeILBxzHXyKiKi6QM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TZP0x4z/b7ZzR1ay4HGau6/eK66c5pKOxrACmJUMHX++xjepoaLZN+bXekQpD07hDaDotc8915N44rRan3C+8k4LFk/nWaufu4p3YwSUst3tF1qd/d5DqSjX2aQMs7uaQmHTPyu9DryFi4Z9bQuHWNaWuLK+/4SNwiEEnHyZnvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EHqi7fzH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EHqi7fzH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B68831F000E9;
	Fri, 24 Jul 2026 05:59:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784872753;
	bh=gzddltF0kuUkrq0AQK3tAMc+nJLo8VryHgKm1pqudd0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=EHqi7fzHZn+ogqXb0FkLSqkjEASBXQMFTZUuZM8K/ufvK/WUSh4L0xtOqvE7voeEZ
	 /FSoqtxS5smMNasqwNzYKGCdnFO/x9ds63V6B9kNNR9hdxjfs4DziOIX5urY8yZkpm
	 fN2//c6wjegDRamfVVZ05ULRmyih7qGcuQgbt/nR0DenW3q1zYFvKld7v+yMy598fM
	 zu4sqq00H9gPHnVn6p2QiUnDFqF5C4OQX7bt9o1gwE++wNo/o1G8+svkn3blKFCJ3W
	 50bigEnM8JegltRmWxLUqs6PSmO2Qny/CI80GFLGgVZk077rbrzfYf0BFb30U8Ssaa
	 xT1/nUx0LOQCA==
Date: Fri, 24 Jul 2026 07:59:09 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Cc: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, 
	Bryan O'Donoghue <bod@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>, 
	Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 1/4] dt-bindings: media: qcom,venus-common: Add IOMMU
 IOVA reservation region
Message-ID: <20260724-laughing-dragon-of-poetry-8ef7a9@quoll>
References: <20260722-shikra_vpu-v5-0-3d80babd4672@oss.qualcomm.com>
 <20260722-shikra_vpu-v5-1-3d80babd4672@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260722-shikra_vpu-v5-1-3d80babd4672@oss.qualcomm.com>

On Wed, Jul 22, 2026 at 07:11:18PM +0530, Vikash Garodia wrote:
> Update the memory-region property to support two regions:
> 1. Firmware-loaded codec carveout (existing)
> 2. IOMMU IOVA reservation region (new)
> 
> The IOMMU IOVA reservation region is required to restrict usage of
> specific IOVA memory range. For example, VPU restricts usage of 600MB
> for specific streams, which could otherwise lead to device crash. This
> change allows platforms to define separate memory regions for codec
> carveout and IOVA restrictions.
> This schema update supports existing DTS having single memory-region,
> thereby allowing gradual migration of DTS to support two memory region.
> 
> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/media/qcom,venus-common.yaml | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

