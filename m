Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 666B335028D;
	Fri, 24 Jul 2026 06:03:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784872993; cv=none; b=hyBneE+cCJnIzhou8gz4eqh+ChmJoIc0owIo2kV/6USCHbKtB8kceJ4Mm1GgnyGPr5ZCjde7FviXAkVzVvZ24f5TtBoeK71xDLBtscpjl8lmD1S6mDGUDbu62pfwDhCmiIJ9cX9GL/CUHEqEBrLAASCD0AXN7gnmSTe1mpEw6CQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784872993; c=relaxed/simple;
	bh=D9+rPKVNLi9NmY6t6moQrGCK8006FEcDDo21jBQivTk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BasTOpzrQsmydRL4netRWYEhuaRx/LQTeGg1zz6W+YozNdJEUSxgPRAg9SfWJU63sTvQY0Qw2gQ3K7uDZh+VkRq93MOIdJxYNzDtOJtxSoq0PlOUqG1I1kTagfUUx+UbuVJ5/a2BBksPArx+iZmcOUfSHu4V8fhOKt2XRq27kG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WMYT+fMu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WMYT+fMu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50BC21F000E9;
	Fri, 24 Jul 2026 06:03:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784872991;
	bh=ToY38GunLrVrU4L06WSjkDSSBvjcYriSfILOcuFLMRU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=WMYT+fMu7Kkp13HsAf3nyZLAJFTDiTdYd0nXVuXzBbIGNQatkn7fUw55aDSg8uWuO
	 VGKyNSD/zmcbzN7ALrppQZ7urJTRpUJ2IXEnOLj6Wwo2W8sxuiMiCNe1+aaSC1lBEX
	 B2d1l14lsux4wySqXaZl/n9TTCB1LV5qpFZC5UZtZsm8zECc6D1LXCNdDwnXhIF69V
	 k+dPTXlEjGtPetBr5wMiugFQWaH2gFSLuIDc9o9rXa8oQV2bzyQwcOsjhNs49FYIiB
	 eeXrdMrsB4Ic93oeLg6TJjdHD7C5tbnYxj0ro3it4n3TCKUl/CvgZFp6x5HjBZOkLL
	 5ZOkE/PeDnEQw==
Date: Fri, 24 Jul 2026 08:03:07 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Cc: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, 
	Bryan O'Donoghue <bod@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>, 
	Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Subject: Re: [PATCH v5 2/4] dt-bindings: media: qcom,qcm2290-venus: document
 shikra venus compatible
Message-ID: <20260724-elastic-amigurumi-skink-a8714e@quoll>
References: <20260722-shikra_vpu-v5-0-3d80babd4672@oss.qualcomm.com>
 <20260722-shikra_vpu-v5-2-3d80babd4672@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260722-shikra_vpu-v5-2-3d80babd4672@oss.qualcomm.com>

On Wed, Jul 22, 2026 at 07:11:19PM +0530, Vikash Garodia wrote:
> Document the venus video accelerator used on shikra platforms by adding
> the qcom,shikra-venus compatible.
> 
> Although QCM2290 and shikra share the same video hardware and overall
> integration, their SMMU programming differs. QCM2290 exposes separate
> stream IDs for the video hardware and the Xtensa path, requiring two
> explicit IOMMU entries, whereas shikra uses a masked SMR to collapse
> equivalent stream IDs into a single mapping. Due to QCM2290's SID layout
> and Xtensa isolation requirements, such SMR masking is not applicable on
> QCM2290 platforms.
> Since shikra uses the same video hardware as QCM2290 and shares the same
> programming model and capabilities, it is added as a fallback compatible
> to qcom,qcm2290-venus, with conditional handling to allow either one or
> two IOMMU entries.
> 
> Reviewed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> ---
>  .../bindings/media/qcom,qcm2290-venus.yaml         | 26 ++++++++++++++++------
>  1 file changed, 19 insertions(+), 7 deletions(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

