Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F69F330B3F;
	Wed, 22 Jul 2026 07:00:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784703607; cv=none; b=uqUFDLGwProO2WzqjilxcNfYWLFWurhLXx0ikhKTWY2r3EvDWCgK3QC+RfaEHE9JSmgJPpBzK2atQs3Ha8oMg5RQY5LIIvdj5IRGkjO/TB78tSC7JWYi80QkeBTrRgQucXkMyBj+nVw0EDlF0P14iQ7flwLbeW5L7I/Ndg6mOb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784703607; c=relaxed/simple;
	bh=2PPFvBfn/Pc2L2g/1O8RSvZWdNck9E4tdDN0sLIokDo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DpScrRf0I9ayrwuXuI4AECJbmIZNelAr+jZqYp0f8GOakF8GpWq/MVIwFNQRIbO/HCYKvitXloz75TJzv3FicAPhrQRtytSTQnDxdyODU1SXVWMVoSUlYsa7j4kQPCvOiYf5LF2qHGzSTVwI8Lqxiqn4/j2QPjOd0iFDD7SYlZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Vz2GFqQ3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Vz2GFqQ3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DCC51F000E9;
	Wed, 22 Jul 2026 07:00:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784703606;
	bh=1qag43zPvLOUvv8dvXgzxys0I5jgEaBVCcZtyX8rrvI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Vz2GFqQ3kmDM3+E8pdVx79b3ByuDYrWV6QNxVaIVQ+Ej9zZcNPSDwrguOEMVTCzrI
	 Gp+GAmW/1j4vuBB/JgkYYHytA0z8VY8W4iCOn40WfMz9uO1d13/aM60nIlX7WYLC2K
	 c8V5xF5cwgfjzMccHXbi8ALUIaNPXijDKz+5jtIha7eaEp29eq9gQ1xCeBuDjGm+rd
	 bU1zNh5eyhMCH5+PSKK2S3i08GqPZwrN3HKfVyV839I3B+EoJ13I3osUAcdUIuRWVE
	 8WGyembYgaaVwNYbcg2+QGL7TQHOUZirKi8xIKJx/sMi/LEYjPCY8Dsw4+92eC9BdB
	 IX2OB7phCgkTQ==
Date: Wed, 22 Jul 2026 09:00:02 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Cc: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>, 
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bryan O'Donoghue <bod@kernel.org>, Loic Poulain <loic.poulain@oss.qualcomm.com>, 
	Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, 
	jeyaprakash.soundrapandian@oss.qualcomm.com, Vijay Kumar Tumati <quic_vtumati@quicinc.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, Atiya Kailany <atiya.kailany@oss.qualcomm.com>
Subject: Re: [PATCH v6 0/7] media: qcom: camss: Add SM8750 support
Message-ID: <20260722-real-diligent-pig-c97d3a@quoll>
References: <20260721-add-support-for-camss-on-sm8750-v6-0-a5f841061d18@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260721-add-support-for-camss-on-sm8750-v6-0-a5f841061d18@oss.qualcomm.com>

On Tue, Jul 21, 2026 at 05:45:59AM -0700, Hangxiang Ma wrote:
> Add support for the RDI only CAMSS camera driver on SM8750. Enabling
> RDI path involves adding the support for a set of CSIPHY, CSID and TFE
> modules, with each TFE having multiple RDI ports. This hardware
> architecture requires 'qdss_debug_xo' clock for CAMNOC to be functional.
> 
> SM8750 camera subsystem provides:
> - 6 x CSIPHY (CSI Physical Layer)
> - 3 x TPG (Test Pattern Generator)
> - 3 x CSID (CSI Decoder)
> - 2 x CSID Lite
> - 3 x VFE (Video Front End), 5 RDI per VFE
> - 2 x VFE Lite, 4 RDI per VFE Lite
> 
> This series has been tested using the following commands with S5KJN5 sensor.
> - media-ctl --reset
> - media-ctl -V '"msm_csiphy2":0[fmt:SGBRG10/4096x3072]'
> - media-ctl -V '"msm_csid0":0[fmt:SGBRG10/4096x3072]'
> - media-ctl -V '"msm_vfe0_rdi0":0[fmt:SGBRG10/4096x3072]'
> - media-ctl -l '"msm_csiphy2":1->"msm_csid0":0[1]'
> - media-ctl -l '"msm_csid0":1->"msm_vfe0_rdi0":0[1]'
> - yavta  --capture=20 -I -n 5 -f SGBRG10P -s 4096x3072 -F  /dev/video0
> 
> Dependencies:
> - https://lore.kernel.org/all/20260720-x1e-csi2-phy-v13-0-160c31958863@linaro.org/
> - https://lore.kernel.org/all/20260708-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v12-0-f8588da41f16@linaro.org/
> - https://lore.kernel.org/all/20260720-kaanapali-camss-v15-0-c0b1c1167c5d@oss.qualcomm.com/

None of these were cleared for merging. IOW, all received comments yet
you send work which depends on it.

This is exactly something Bjorn said a week ago or so. And then a few
other maintainers re-iterated. Exactly the same, nothing learnt.

Best regards,
Krzysztof

