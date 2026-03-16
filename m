Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D87883502AC;
	Mon, 16 Mar 2026 07:42:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773646946; cv=none; b=HB+ux8mD8wqxBPSoM7Ut7aTCyQxDiXA25O2BfkUX159/B/Efg2ZXfKf8UtONap/m5eOtMsF+8pXOPYF7szk7xr/vOZu+EKgqSjNR0VtKKdFh37ow1omoCuoJHh7PK1GW/+66IBTc2Y7VIRbYPv1knTsEpbMYNeQ30ozHobobFEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773646946; c=relaxed/simple;
	bh=hIUAKDh+REJ0MMUHOyhuYjsuX8c4XRSYMvOE9eLEEDE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z4jluUYZyDl7iZzQcVQqWEz/+f4Y7xU8wggAMjSpH3pebHwWEs5dsa3U4lHOjkkw51IDpTdu2w/15c/F1T00zhebYuglCKlAvgJ30f/VFwsdAk7SCrVGE7zQZBeM/KWv4Rn4Ma9IQykZBX+Z4Jc+TqhM/M0jPrQFcsHRtAWsin8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h6bNMHPa; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h6bNMHPa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6FCAC19421;
	Mon, 16 Mar 2026 07:42:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773646946;
	bh=hIUAKDh+REJ0MMUHOyhuYjsuX8c4XRSYMvOE9eLEEDE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=h6bNMHPat9SO9xY6/+I/reiLeceXOiPu8gWq6ZE245Yn3McMB8r9KfytkN5gwoMow
	 ALpB5+OiLrSlGhk67s1gU1t38XbR3EvWAsdOOq7t8BRdmjKDbVhz45F2RVbnKHSj8n
	 NWoTFOcvQYq8y3A9BFKsYOo2Y6scQYiaDSXsSRSof+ZlTKAvsBrSoTyrntWhO1cOMO
	 YLunE7lrBAfX8ecEzMevpF9ePJaubsQ+BvyBeDq8wh5HCp9FxnI16+sn4U0MPpJCoL
	 eI6uHp1Ue7drsyhXzmB7pcg3Dg3ZlF9utm1UUWYfbC/GrBVVavCV+zTetcQxciw6VI
	 qRsF4atGhEoCg==
Date: Mon, 16 Mar 2026 08:42:23 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Bryan O'Donoghue <bod@kernel.org>, 
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/2] dt-bindings: phy: qcom: Add CSI2 C-PHY/DPHY schema
Message-ID: <20260316-delightful-cordial-jaybird-2d409e@quoll>
References: <20260315-x1e-csi2-phy-v4-0-90c09203888d@linaro.org>
 <20260315-x1e-csi2-phy-v4-1-90c09203888d@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260315-x1e-csi2-phy-v4-1-90c09203888d@linaro.org>

On Sun, Mar 15, 2026 at 11:52:06PM +0000, Bryan O'Donoghue wrote:
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
> ---
>  .../bindings/phy/qcom,x1e80100-csi2-phy.yaml       | 133 +++++++++++++++++++++
>  1 file changed, 133 insertions(+)
>

<form letter>
This is a friendly reminder during the review process.

It seems my or other reviewer's previous comments were not fully
addressed. Maybe the feedback got lost between the quotes, maybe you
just forgot to apply it. Please go back to the previous discussion and
either implement all requested changes or keep discussing them.

Thank you.
</form letter>

Best regards,
Krzysztof

