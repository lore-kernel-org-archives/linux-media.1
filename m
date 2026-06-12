Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A11AF29E10B;
	Fri, 12 Jun 2026 09:11:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781255475; cv=none; b=On9Q5HoqzrRCxYxCXlQ9skryLS0jmBV0I1BabtFSqc2lxahmvFAi7T89vGGLlwnTNWGsnDa1JSJA9JGz6vsURpMAkO7bqPvNUa+84oU+BRmjU+hz97/hhw623XNWHZx3VYeIS+qr0phiEAYW0n7hW6g+mjyd70t9YTsBw7t90CY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781255475; c=relaxed/simple;
	bh=sA7XHTR+hUu1GOIidIrazCy8bVz0wveq1McrnESdVO4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jX1ZTKjbwCn3iBIpsgXR2cndIHg2eMesBj8QH2Ur+BsHX8E3iCMBgk67eJu6nu+B5aYIpJi+cvAjWks+Dkal9yWUR7O6fSVVuQf9qxCb9hO4LO8SQXCmej2ZkSeONKviHM4fvcoKjqT6fA2RJh4FQ//MkWInvrBT4iDCv5M5aD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KzEa3Bko; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KzEa3Bko"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDCEE1F00A3A;
	Fri, 12 Jun 2026 09:11:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781255473;
	bh=PQ4QzvJCcyyUBvM3LmUN3c7vcUQePiRiidAiUwgM9rA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KzEa3Bko20ri1xq7WNCzHIPuqdbpWldg0H0nLjZ+H0+FJ0oF9puLF8kMs36Dck8Pl
	 u5ZCPpY4AllDcGfU8mUNSrX9IcNrCLCmaNfMnyzBicnUTDZ0WTn/Px5PXR28O9Vptv
	 UTimAjUo6T864VFDA5Md0DBL6H227Pf4V4zS4qwQUu0aJa8GogeLNi/TsJn3d1YJg/
	 H0PucKt6zk0NLyvDV2blcjEGuF9eA7iMP1fMyaw4hE655QV/K1ZmwtOJLNz1TLyqxy
	 uOWDn5kkYeyANABJDfdTz0Hj9iww9qicGMf8s9FlRZbUmjQTWYjjrOq7eYB7vsg126
	 IURkOOoiSyEQg==
Date: Fri, 12 Jun 2026 11:11:11 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bod@kernel.org>, 
	Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: media: qcom,qcm2290-venus: document
 shikra Iris compatible
Message-ID: <20260612-faithful-literate-vulture-a3bf8d@quoll>
References: <20260612-shikra_vpu-v2-0-bf8727370a1e@oss.qualcomm.com>
 <20260612-shikra_vpu-v2-1-bf8727370a1e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260612-shikra_vpu-v2-1-bf8727370a1e@oss.qualcomm.com>

On Fri, Jun 12, 2026 at 01:19:40AM +0530, Vikash Garodia wrote:
> Document the iris video accelerator used on shikra platforms by adding
> the qcom,shikra-iris compatible.
>=20
> Although QCM2290 and shikra share the same video hardware and overall
> integration, their SMMU programming differs. QCM2290 exposes separate
> stream IDs for the video hardware and the Xtensa path, requiring two
> explicit IOMMU entries, whereas shikra uses a masked SMR to collapse
> equivalent stream IDs into a single mapping. Due to QCM2290=E2=80=99s SID=
 layout
> and Xtensa isolation requirements, such SMR masking is not applicable on
> QCM2290 platforms.
> Since shikra uses the same video hardware as QCM2290 and shares the same
> programming model and capabilities, it is added as a fallback compatible
> to qcom,qcm2290-venus, with conditional handling to allow either one or
> two IOMMU entries.
>=20
> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> ---
>  .../bindings/media/qcom,qcm2290-venus.yaml         | 26 ++++++++++++++++=
------
>  1 file changed, 19 insertions(+), 7 deletions(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

