Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86FFB1FF7B3;
	Sat,  7 Mar 2026 15:34:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772897698; cv=none; b=axPksJ5TlpCUtyymvsI1WIyUjRY0EnQ9UsO9eRWPzRKSYeRerrEmU+gudsae89BtVo0Ksyr1XSvbaa1qSFaDK+H4hjFeEQeF+cOlygSaLwzWs038A+kKw0npvuNJyeci7JGKWQp5T2aeEjNj8QHXwGJFmgvkhGm1T70tnFTloiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772897698; c=relaxed/simple;
	bh=NlSe8298HoOpJ/atUz7AIES/xI874DseDR7tDuvxLUA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R8/Jd3ed2adz+RGIfCFRK58HxK8/AQmP25eP4D0yXzWLtLcajdbJcdgq38+OunB2eiAaCyrVd2Cwb1VJraTvi2M6xC5GQGVGyUSPY1SkUhppOd7NfL7WPpsYghB/q36RajeacZRAj4/9vgv6gjrLB96vpRjTz3xeN6Zs3LE1ngM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RwKTHS7N; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RwKTHS7N"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3627C19422;
	Sat,  7 Mar 2026 15:34:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772897698;
	bh=NlSe8298HoOpJ/atUz7AIES/xI874DseDR7tDuvxLUA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RwKTHS7NunaS8JEfiQf1l+yBHHF1hw5LQrLaGuPzJnMLwTB5LqI+ydhdI/ZQcTySX
	 MZCzLycHI8fBKVVlszMOnsW35Z5Vc0/x3lcmmKCDcAxWsd5t6PG85q1/yF6d4C7f6g
	 VnefBH7SrSHngDZ6Ow2P1l5YGoL+ZR/ZFjyVtRCB86NAtQ0hqBif7JFlEnk7bLefDm
	 x7MyWzXAmUcu5hRgBdpAX595HtreMVMqYyx1lWF/7J/Tw17mBhOObwqqq9EDWYtcfZ
	 JNSxJZnQjm8dV0sn4d62WUrzb5tGJet6lU0R3yz3fiCXVUXuwHOdpiwayHqNaSERuS
	 RFZeL5paowfiA==
Date: Sat, 7 Mar 2026 16:34:55 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Michael Riesch <michael.riesch@collabora.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Frank Li <Frank.li@nxp.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Kever Yang <kever.yang@rock-chips.com>, 
	Collabora Kernel Team <kernel@collabora.com>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/4] arm64: defconfig: enable designware mipi csi-2
 receiver
Message-ID: <20260307-majestic-otter-of-contentment-eeba71@quoll>
References: <20260305-rk3588-csi2rx-v1-0-0cd8d2bf28c0@collabora.com>
 <20260305-rk3588-csi2rx-v1-4-0cd8d2bf28c0@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260305-rk3588-csi2rx-v1-4-0cd8d2bf28c0@collabora.com>

On Fri, Mar 06, 2026 at 03:09:51PM +0100, Michael Riesch wrote:
> The Synopsys DesignWare MIPI CSI-2 Receiver is integrated into
> recent Rockchip SoCs, such as the RK3568 and the RK3588.

... and used on boards foo bar.

(becuse we take defconfig for boards, not for SoCs - if there is no
single board using it, then it should not be enabled because it means
you do it for downstream which simply does not exist for us).

Best regards,
Krzysztof

