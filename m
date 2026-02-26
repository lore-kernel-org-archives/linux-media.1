Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D52414D29B;
	Thu, 26 Feb 2026 07:37:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772091444; cv=none; b=gl+/Y+9/qBguKHRsOrEpJWRzDXTjnjBXPcV2ikETmn+KZ7FhMo/nEjzk2+ZJJaXckommglwgTBRITlVKvRJ2jK/ZNtuDljuCX8Xdm3vfPHY6Hh/ljU0GfMaUa8dkR032cPkW28vYxGonRfwDAXn2fXbGExU9HO1fhU9My/X0BWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772091444; c=relaxed/simple;
	bh=H/aL3sXj9Y0p9O6xgoUv9PCYkdU+dBRZTIFX6KiQBtA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ly2VKkcbi9PdKdh2soio6Aw4/KN15/jTbLV+LkUBddULCn35Hh82oiSnQJNdH95GU3MNmVnWBJqlKbrQKhMLtEck05iSmgpzgrpLUg2o7ajARUBW0GdKfQt1O6KWaDBX9hfLVHylMfW/ldOYJitaDDrpkT189phFBa8+ml73L+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vMXm4rFS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vMXm4rFS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 257A7C19422;
	Thu, 26 Feb 2026 07:37:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772091443;
	bh=H/aL3sXj9Y0p9O6xgoUv9PCYkdU+dBRZTIFX6KiQBtA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vMXm4rFS2SmBCVooAjw2ilkamKIEtSNNI3taOlPyPecAUjNIr5uf7EVqQaxg8emI6
	 rALMvOBJTqL18fsmX6ZXu+XKIfXyBpHRSUIdAXtKu1xYEmISn5D1sI1aKl9ll97f2C
	 QIrj9+dSExNONoOtByXkDtcggQn/3LNvICunPVOyR1X5IGUCUGKEVLVGv+It5b2Bps
	 hCqGvBDCngyIexX/GYUIv1T37betyBmNvWc7ytaUkyeiPbYctit4ixa/gZnVcvCmB+
	 ljf1KyNOuN8tv0eI0VsjLd0shIo/SmjBKfb5g0Bs41sAhmx+JgjBiCMPTmBYAotg5r
	 /f5Sx/NEktp+Q==
Date: Thu, 26 Feb 2026 08:37:21 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Bryan O'Donoghue <bod@kernel.org>, 
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: phy: qcom: Add CSI2 C-PHY/DPHY schema
Message-ID: <20260226-carmine-cockle-of-prosperity-b6baf2@quoll>
References: <20260225-x1e-csi2-phy-v2-0-7756edb67ea9@linaro.org>
 <20260225-x1e-csi2-phy-v2-1-7756edb67ea9@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260225-x1e-csi2-phy-v2-1-7756edb67ea9@linaro.org>

On Wed, Feb 25, 2026 at 02:59:12PM +0000, Bryan O'Donoghue wrote:
> Add a base schema initially compatible with x1e80100 to describe MIPI CSI2
> PHY devices.
> 
> The hardware can support both C-PHY and D-PHY modes. The CSIPHY devices
> have their own pinouts on the SoC as well as their own individual voltage
> rails.
> 
> The need to model voltage rails on a per-PHY basis leads us to define
> CSIPHY devices as individual nodes.
> 
> Two nice outcomes in terms of schema and DT arise from this change.
> 
> 1. The ability to define on a per-PHY basis voltage rails.
> 2. The ability to require those voltage.
> 
> We have had a complete bodge upstream for this where a single set of
> voltage rail for all CSIPHYs has been buried inside of CAMSS.
> 
> Much like the I2C bus which is dedicated to Camera sensors - the CCI bus in
> CAMSS parlance, the CSIPHY devices should be individually modelled.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

The entire point of separate CSI PHY was to change new devices. That's
why I was postponing TWO new bindings. There is little point in change
existing bindings, it's just a lot of work with little benefit.

And the beauty is that you did not even had to do the work yourself,
because the contributors of new device would need to come with CSI PHY
split.

Best regards,
Krzysztof

