Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFD513BB134;
	Thu, 11 Jun 2026 09:15:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781169309; cv=none; b=VEPDR2Ng0QNhVer2Hc4Ex6aA34+5TMOdErFFDJ5r8vXgFGGC5E1K78IoY7Yv0MYBFikj2JKNPe7LWsBx1EevkqmlVHQA8JnIQN5d8BY/B+X6W8U9Uq8361MsjyxhVaZdJhptjkIgHKPnLrRhMLU+ANe7B3QPj7jZtp5XOTHjgmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781169309; c=relaxed/simple;
	bh=vL+KAPwmGDi8Z1ihP1tz+SOOBD0kJiZE8IMdQfmRgoY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qT45Mk0aHUx1wBD3qg1pkEe0Lzz1gX+jvwrwHJM6Ph2g8JUqWy4BH4rX8p8VN6bhOLolNvEIW4Z+WGFeNpaiOFJypGE5yq28Xjj4qhi4+hztb8nHtJ3MqvCJ4N4hq7uyUB45gpeNr0jRG4cnjUJxnfXZvvgX6AbUGKAP1oPzwJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C+2ob+7N; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C+2ob+7N"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25BFF1F00893;
	Thu, 11 Jun 2026 09:15:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781169308;
	bh=7JXC/K/YYswCgRaONX63U5Y+XfOJObbnQSDICLmsE9s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=C+2ob+7N2q/Y4M88HEOUYnGbTnKgY9zysmYinGNyA8rRdr9LH6UR5MK49d84rBrXQ
	 Nt/JNsdnI3FEp9oN4RpKebghpbGBhz5eOryavbOnECa716OVqTUR3qShmV8ue25qnH
	 9MsJKOqfc9MFmUhYvvzIhkb8cq39sIjf37hp5Kj2BrmBFTdx9zP+l/LJMZUg0aMuTB
	 Y1lexqTBu7fBJ7kQM9AwhiCfktbW0TDt5DOe45wBVJ9y35hHcTXzJ5NhU2D+bl7QW5
	 9uVVYz761uk5YAa/tZlItZI46N9WrdiWl2Za+pe/ZepZlkK3qzIE7R5FYOv/xfn7fr
	 8vtIBtnOen/1w==
Date: Thu, 11 Jun 2026 11:15:06 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ramshouriesh <rshouriesh@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, Loic Poulain <loic.poulain@oss.qualcomm.com>, 
	Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Aleksandrs Vinarskis <alex@vinarskis.com>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-phy@lists.infradead.org
Subject: Re: [PATCH 8/9] dt-bindings: phy: qcom: add MIPI CSI2 mode constants
Message-ID: <20260611-happy-shapeless-capybara-dadd28@quoll>
References: <20260610-a14-himax-hm1092-v1-0-0c9907da47ed@gmail.com>
 <20260610-a14-himax-hm1092-v1-8-0c9907da47ed@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260610-a14-himax-hm1092-v1-8-0c9907da47ed@gmail.com>

On Wed, Jun 10, 2026 at 04:39:33PM +0530, Ramshouriesh wrote:
> The CSI2-PHY binding references <dt-bindings/phy/phy-qcom-mipi-csi2.h>

No, it does not reference it.

  $ git grep phy-qcom-mipi-csi2.h

Zero results.

Best regards,
Krzysztof

