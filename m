Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F396E347BDC;
	Sun, 19 Jul 2026 06:28:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784442493; cv=none; b=q6YDoxFqSHNYRl+vzKqXrIz/Pqp5HR+XcDjWLNIyKs4etEURfb+bYXlyhfd9QkJP3rVPKS63FrMYtzHIbf7BnT74EFpFvbpNt8zyDghD1TESZwc/YPl3gXyWIfz6uPA5wOLdtuHqj4CKfDJ05mgyx9AmVi2u+bx+9ML3bYQ93+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784442493; c=relaxed/simple;
	bh=9iw4M/eOzCAdUXCT4u6tAhY/unOg/V+D7Fc32V5Uzi4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oWCoJn1PIr0KEmgJu7aEupVeVzgwpdp2cbZdOlGfEYdR3zeq9LgwQcCUGtLhJCKVKLHytTnT1Z2x13VMqXlqHMBAoQZ5hK6p7NaS2ZVTpUMaeIHlCFrodhL79Ev6gI4oT9DcQFCRXOVfo2qz2n8IpjKxNu0m5w9oeHUS9HUFCYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m6Yl3eow; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m6Yl3eow"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96D6D1F000E9;
	Sun, 19 Jul 2026 06:28:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784442491;
	bh=UQoXqfEBpAt6v+emI5izvhq1VvHsMHK/ap376N19A8A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=m6Yl3eowjZffPDvmmVJ55kv2AJc2VODML6zPwXABUiXiMUgci8v+ocgEnHEVKoL4K
	 3KyXezS2Ee4JG7dTbkf9+vJ9Tf0SZ2LLtxzaKdh9Hf3REXGjwOIQv8ffAegBQlODd7
	 DQaJ16fN0DRr1PZK/9jijyGS6OOTIa5cjdPC6IduaDmN3PIDq+jJrWGOtfAERVRXqy
	 EnlqwTknoZZvoZ4zuoJV72+ztodAof1SMcgCQ04bZOpjFYcWvwMRlyCvDyhFPVfPww
	 4yo9oYN8qPDf570GHVQqLGfmVJK9WVsxpcDS3ZslEzRa0KfkSPRD4Ra9mEGwxCtegh
	 AzB9aJqSekWUQ==
Date: Sun, 19 Jul 2026 08:28:07 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Bryan O'Donoghue <bod@kernel.org>, 
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v10 1/2] dt-bindings: phy: qcom: Add CSI2 C-PHY/DPHY
 schema
Message-ID: <20260719-electronic-swine-from-hyperborea-b1edbc@quoll>
References: <20260718-x1e-csi2-phy-v10-0-5720a7888953@linaro.org>
 <20260718-x1e-csi2-phy-v10-1-5720a7888953@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260718-x1e-csi2-phy-v10-1-5720a7888953@linaro.org>

On Sat, Jul 18, 2026 at 03:38:17AM +0100, Bryan O'Donoghue wrote:
> Add a base schema for the MIPI CSI2 PHYs on Qualcomm SoCs. This PHY
> supports both DPHY and CPHY operation. A special mode of DPHY operation -
> called variously split-mode or combo-mode also allows for two sensors to be
> connected to one PHY.
> 
> The submitted binding here describes the DPHY modes of operation only. CPHY
> is left to future work.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  .../bindings/phy/qcom,x1e80100-csi2-phy.yaml       | 195 +++++++++++++++++++++
>  1 file changed, 195 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

