Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.167.242.64
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795452953;
	b=X/WPHAd671bracaqEEbbXaVzARoWg0JVfpz9VKN294m13MdqxBXzicYstGfZ9iGN3G5q
	 4Jo7Yusx5x1/ot+wwQhUIDAYtizWqPLPU9VXcBa4q4KK6A6sMs1jXvU6Ss9B4X9vannNB
	 d54wYIdnUPW/MENYZLpP5YYwK725uPbLbYU/+TLZL9XuUiP9kS1ETiRDxWO2I8cby83JO
	 8b+U/ro3TjxNXxxTvLLA2HVPNO62N62LAh+Orz73Hgg7i0zck6iSC6GbFlfbkJbgq6dSZ
	 C7tAloIuauIefMYr3D2bPlaFXNnCk7GORboq9aVJdIK7Ivaq0Z7fG2qk49dF7ETHvvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795452953;
	h=DMARC-Filter:Received:DKIM-Signature:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=PhPty5Pk5FoTMUpwzy0rqVwfMQchDrwcfqdIpjAYoaQ=;
	b=og4FAzXrvMbo///kqc3/thHs4kklfIhPHwvLtETZpi0favyKd2AzKnOBqzdM9EWHKuIi
	 PpInW1PSemb67CNy1c9JK9Bq2M2Vch3hRR3CTRzhUj6B2la/z9S6kLFsi7Us6j+ifKBh0
	 6v6j/Ht+/6tBFg+zvr2d/GqAxKRRPXBTQcv4YG2luFSUzyBeFqSnhyq8FRZoBXI1n5hhS
	 fkIk+2yEF9gVKRvwFJk9Lf2PzpfSKPee44feorAiN5KDLPVhyNGueiB/nsyVRoFaX9ofA
	 zhFS4gcJtKF3Djp2NBLcChv8KhSdTE6r1mxGOw/hvAYm0V4BV5sfW5yVeeI/t7T7GXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ideasonboard.com;
	spf=pass smtp.mailfrom=ideasonboard.com;
	dkim=pass header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=AjpeLAvE;
	arc=none smtp.remote-ip=213.167.242.64
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 632B1606A31E
	for <linux-media@vger.kernel.org>; Mon, 23 Nov 2026 16:55:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 632B1606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=AjpeLAvE
Received: from killaraus.ideasonboard.com (2001-14ba-7086-3000--a06.rev.dnainternet.fi [IPv6:2001:14ba:7086:3000::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id AFD8F524;
	Mon, 23 Nov 2026 17:53:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1795452798;
	bh=AJSYiiyI9tLqDmxNG0ueD/WakkyOgyv/K6t6rCOY8qI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AjpeLAvEEZen2Yd5UeNhAahLB69aG3mFqoOXlAWjYsDwISfxowM6wlwq98R0TdRWW
	 oSbuumbcDQjc20AUZH2PTrhAcnVFS0gRH9Uq6h4qvVuzz5rotGJbO9ROVtN2Fn5YZm
	 uZtqhIFhxhVvjA0KwEcfY8hX1jHw4pSOQ/rOmhc8=
Date: Mon, 23 Nov 2026 18:55:49 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: david@ixit.cz
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>, linux-media@vger.kernel.org
Subject: Re: [PATCH 0/4] Various CCS fixes
Message-ID: <20261123165549.GE2959742@killaraus.ideasonboard.com>
References: <20261123-ccs-clanked-fixes-v1-0-fb2bcc87a517@ixit.cz>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261123-ccs-clanked-fixes-v1-0-fb2bcc87a517@ixit.cz>

On Mon, Nov 23, 2026 at 01:02:38PM +0100, David Heidelberg via B4 Relay wrote:
> First two seems to be no-brainers. Next two seems to be correct too.

What exactly do you mean by "seems to be correct" ? Are you sending
LLM-generated patches that you're not even sure about ? That's a
complete no-go.

> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
> David Heidelberg (4):
>       media: ccs: Use dev_dbg() instead of dev_err() in ccs_enum_mbus_code()
>       media: ccs: Fix sub-device index in ccs_cleanup()
>       media: ccs: Update PLL and blanking limits when pixel_array crop changes
>       media: ccs: Set V4L2_CTRL_FLAG_MODIFY_LAYOUT on flip controls
> 
>  drivers/media/i2c/ccs/ccs-core.c | 14 +++++++++++---
>  1 file changed, 11 insertions(+), 3 deletions(-)
> ---
> base-commit: 909ef7a9a30fa139e69e555e3606680f5cca7726
> change-id: 20261123-ccs-clanked-fixes-609bb0754028

-- 
Regards,

Laurent Pinchart
