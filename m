Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 534F03B27C5;
	Mon, 23 Mar 2026 19:35:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774294522; cv=none; b=o+s3N0CZWXaLA6gSfII0S2lbYbvWRZSknmOyb4gdro018ZyUsjqoTj3k3hLjI50F8cXt3G+B+A6v3UHrAMD9Kys9BJnxtkoPo2U+TzeQyzV7Psvw+0iGfZDz0FJYBZe2U2X1HkoI4aWs7KkOvL2M8X+vcWBCTB3IOItB3z1vqjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774294522; c=relaxed/simple;
	bh=i/t8VSKp5b+BL5E8gx+o445vAz2TiAkmdeFV5lM/HPI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GBhzdWEXew0mTpLBwNUQEEn5rPXVjgmh8IEIaEutF1bGB4K/LZ7nDbJDJIUZV9xBUScE5YRj9kVpib55LcJCbzxUYbbE1Lt0IxdTgtZc3+1br65ie+TF5mOzFa4OlAtNoOySiq6Cjv7ti/rc8WVqxAi+ahwp83hGTg4Fw9Fb5vk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i51Umrv2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i51Umrv2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B188C2BC87;
	Mon, 23 Mar 2026 19:35:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774294521;
	bh=i/t8VSKp5b+BL5E8gx+o445vAz2TiAkmdeFV5lM/HPI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=i51Umrv24x2wYxi5FuXuoM4znGJSMe8lAkc2oCadrO+TOCZdcoWNwZQS3hzaK9EHJ
	 ClUdWOK/5H9wMZI/KIvWBToZPSYD0WhseP7jbi1xX/n7VN9UqNB+dr+Ypt1GQk605U
	 0jJVngIokSRQTaUegoeVm8rqtidwZ9Ci9gA2WWxQV8gkCcskRyuWtAmQmdqT0wAcjW
	 0ftIvk+zsSaC7MvPl1PcfCyVrU47G2/lE2OStAC6iEp9rts/dhqKRYzc0BRbEr8qKc
	 nbYd3zFuKJbBJy0yhK5Kt9IuJ/lIGuk5MHdJspVhVqeaVALvdcVyVjkVbsoJpwMzaw
	 rZA/42lWPwugA==
Date: Mon, 23 Mar 2026 14:35:20 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Michael Riesch <michael.riesch@collabora.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Kever Yang <kever.yang@rock-chips.com>,
	linux-rockchip@lists.infradead.org,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Collabora Kernel Team <kernel@collabora.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Frank Li <Frank.li@nxp.com>
Subject: Re: [PATCH v2 1/2] media: dt-bindings: rockchip,rk3568-mipi-csi2:
 add rk3588 compatible
Message-ID: <177429451982.1234730.1312051337335309882.robh@kernel.org>
References: <20260305-rk3588-csi2rx-v2-0-79d01b615486@collabora.com>
 <20260305-rk3588-csi2rx-v2-1-79d01b615486@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260305-rk3588-csi2rx-v2-1-79d01b615486@collabora.com>


On Fri, 13 Mar 2026 12:08:45 +0100, Michael Riesch wrote:
> The RK3588 MIPI CSI-2 receivers are compatible to the ones found in
> the RK3568.
> Introduce a list of compatible variants and add the RK3588 variant to
> it.
> 
> Signed-off-by: Michael Riesch <michael.riesch@collabora.com>
> ---
>  .../devicetree/bindings/media/rockchip,rk3568-mipi-csi2.yaml      | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

