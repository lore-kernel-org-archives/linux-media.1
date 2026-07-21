Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBA833803D8;
	Tue, 21 Jul 2026 14:06:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784642768; cv=none; b=hcXCOhK8KzjeSaQFRGUE9WTJ++upr+vU1dVFdrQUU/7UwuJaGzZjzzhqwsf9gkS+u/4whK/PDFOP7IcxBcZzIxciTo9NCW1qp5MvUY4V8FKzTcT9wbqWk15av/OFV0CoUtSUdPyJ7xwFNlCGKp/z9S5Y5iHK7F33QeFx9CE4NIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784642768; c=relaxed/simple;
	bh=F3Lvowbnq6X5KK6KhicW4vHwFwl36KHXmAtDzbhDSdQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ejt0FiBPjHBFnBRxZGj5c8fjN5/ma7WjdEO9isYznlo79jpxSs1LzIsdM7TLi/aEkkm87qpro6VcXulLk3Zixb6RR6EEYb/vgnUHubiYCBUxEpuNtyVjLCYGOR4NjdF3RF7MTic/nso3D+DdPw/mUVf7RWKvHl6kPUpksh/I7CA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U9rQ5GKD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U9rQ5GKD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FF441F00A3A;
	Tue, 21 Jul 2026 14:06:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784642767;
	bh=JprtqjeLYlbNYlKn0Fy7LJlwRGfgAcWOsTGs+PkKZDk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=U9rQ5GKDJNNe79I+Oko9UiOuuT4cfFdOCYLl8PsDibrSK8xjT960C1OpGeqYIuofx
	 xUzumRQhroqDanWccgde+35mNnTw2dSdPkQyFL73VK0tUtOMfE9C2z7UKqu6YwexoX
	 oAthT0RbrwaKsetUuN1kxXIDZOJxSxJYDGUrYwUosUD35DeMfaP5tfh8IBBC3/kv6m
	 6QCLvSyUPIv+FR4we+MEP78MS36q8YBX32WwsbZRvl2S40/0PoZ0kxprDL/e/f+VKa
	 lPMIJRLKSz/gPRmk04D+PnsTRrHp4NiVanBGRBo/jto4jABANDIp7BD2T80UI3QozC
	 uHTlvtv3WA7Og==
Date: Tue, 21 Jul 2026 09:06:07 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Bhargav Joshi <j.bhargav.u@gmail.com>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	linux-kernel@vger.kernel.org, Benoit Parrot <bparrot@ti.com>,
	goledhruva@gmail.com, daniel.baluta@gmail.com,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>, m-chawdhry@ti.com,
	simona.toaca@nxp.com, linux-media@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: media: ti,am437x-vpfe: Convert to DT schema
Message-ID: <178464276265.3574233.14425595465663414801.robh@kernel.org>
References: <20260720-ti-am437x-vpfe-v1-1-d4a260021b64@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260720-ti-am437x-vpfe-v1-1-d4a260021b64@gmail.com>


On Mon, 20 Jul 2026 02:43:23 +0530, Bhargav Joshi wrote:
> Convert Texas Instruments AM437x CAMERA Video Processing Front End
> (VPFE) from legacy text to DT schema.
> 
> Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
> ---
>  .../devicetree/bindings/media/ti,am437x-vpfe.yaml  | 93 ++++++++++++++++++++++
>  .../devicetree/bindings/media/ti-am437x-vpfe.txt   | 61 --------------
>  2 files changed, 93 insertions(+), 61 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

