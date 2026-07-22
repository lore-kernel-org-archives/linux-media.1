Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02E583F9FB;
	Wed, 22 Jul 2026 07:01:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784703673; cv=none; b=ruTG7R/1N2YkI9v4nVfksC7orMeebE4rzmIZysga69k/dNWBGM+0X6A8IKKDfT8iMDcp+waBqjx4b6JPtMDg5TMztADj+Not888Jllu+CWpAOK4baQg9QM20X7teOm4BVF1pN9yYWQpsRgXpAb02YzqKu7a+x0jfkQj1pc+kYro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784703673; c=relaxed/simple;
	bh=gDq48SDa44mMrqAXCaxOL0HPIua4m0ABHDJCra1EBAc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z2p2xVkckUpdE9JcCNutf80/ADEihZ4RzECRqG672u6iuwGgokLG9Bpwmgx+EJRW0T36+gDV7Y3Czf7E9X4amwCs6k1qutZC7DHnM2eZ0YeMabrFcUnpwW2CmTdPPt90tGWf5hJEnvqSeOaLc1LI1vhlAQSULGbC0DiszPI2lII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=esa6/k+P; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="esa6/k+P"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6934B1F000E9;
	Wed, 22 Jul 2026 07:01:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784703661;
	bh=CI+UMo385N4h+hc9M6wJenaTKuLPOI4BaoeYVQ49/R0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=esa6/k+PMxEFbkw7m4bgcelBl49jBZiH9qd5G0ZvGMysh72ybSGx7sabDnxQqE603
	 rPgUTSsSrY9bv/EXXfXx2lwhBXJtIBDNWPn510TP5thoCShlUdsmCxZiJoy5rB50ZZ
	 hn5av/a4drQdOWhKNI2bQWmJ/5U4baK0meLPd9n+hQMxliFCSTd+1WN56CxlkK5bvR
	 IN9m0M0nF6yQ+5rB5N5FpsRJ+1SVVijR02KTVh8YaLS0B6lcBtlfqnJSlJVW7SRFcb
	 oLMxdQdI1tj+3lMmMSZGd44tLS/Hf4yFRyfW9pPrZK0hYV8Twkpk8O+jJHPjZ5n+0y
	 OYRD3f5oeN4dA==
Date: Wed, 22 Jul 2026 09:00:58 +0200
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
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v6 2/7] media: dt-bindings: Add CAMSS device for SM8750
Message-ID: <20260722-enthusiastic-hyrax-of-zoology-17bd7d@quoll>
References: <20260721-add-support-for-camss-on-sm8750-v6-0-a5f841061d18@oss.qualcomm.com>
 <20260721-add-support-for-camss-on-sm8750-v6-2-a5f841061d18@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260721-add-support-for-camss-on-sm8750-v6-2-a5f841061d18@oss.qualcomm.com>

On Tue, Jul 21, 2026 at 05:46:01AM -0700, Hangxiang Ma wrote:
> Add bindings for Camera Subsystem (CAMSS) on the Qualcomm SM8750 platform.
> 
> The SM8750 platform provides:
> - 6 x CSIPHY (CSI Physical Layer)
> - 3 x TPG (Test Pattern Generator)
> - 3 x CSID (CSI Decoder)
> - 2 x CSID Lite
> - 3 x VFE (Video Front End), 5 RDI per VFE
> - 2 x VFE Lite, 4 RDI per VFE Lite
> 
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Drop both tags.

Binding was very different.

Best regards,
Krzysztof

