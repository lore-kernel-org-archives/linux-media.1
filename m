Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15E7E3F4DE1;
	Wed,  8 Jul 2026 07:07:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783494483; cv=none; b=onL+fs4umzrind47o9aa/iCtIO1mWCwu0hIgWwNjWEIyMfKu37cGgFHvvohedAsGkni6tW/3zlHeKbkvFCa+R+fLhdp0U7d9MbNaz22S2xAtzBApZp/9ARaD+xVd1y2oi170gegs/EZ9WSVw6qeeA4Y6RnR7tjEEWATY4iFtX0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783494483; c=relaxed/simple;
	bh=8OmjP1C3eqGW1vyoaH/AvAzOD3KAwXBGQtZqfYxXxCQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Nx1os9WstUU0/DcAFtn2uBIlxk0fuMbGuKa85gOfwuEvl/xSl3erLBHQDvLLQ6YmAK9paxpPpJqCxdANpMCf53lKDwe778E59YqwN8ecH3QPrKvbjMWefroRJME3+R4GZqmIftVhakO0536ul7U88HrYItobEQlju/bG50psyoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m8yi/wQd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m8yi/wQd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DAB311F00A3A;
	Wed,  8 Jul 2026 07:07:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783494466;
	bh=JGy+fWbj3bn3OEzh7hjccT5O03Rm5z43AWv6lrvA2dI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=m8yi/wQds1R43Vbtc5bV9wMcWzjdDmOveSG/5LEJ6o4b5NsAeIlcVL8MuUxdJ6HUv
	 Ve/fLNSzPSoU6SCbWd8lefkHTJgtCL7qaMEkFt9WLPUP8M2PP48Wq6KOHTWn7POdTI
	 rT2RO6SYFExIYMsK83Bx2wOU0AtnqOEp0FTwke5rHv8a4EuNpkttgUGbzIKzlkz48H
	 TSQbu2CnplBNd9xx6TOQa1+OpmsF55fFNPdy8DPzNMNcMUj9CnDJzG2cDjSnnKShbG
	 as5AWeidGwIpa7ojn9l/kMzjL21O9CiYI0Mbx2Xt8rH1BSOPE0Kv/G09JZws3hJN9G
	 XaC79Z74mV78g==
Date: Wed, 8 Jul 2026 09:07:41 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Tianshu Qiu <tian.shu.qiu@intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Richard Acayan <mailingradian@gmail.com>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, David Heidelberg <david@ixit.cz>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 02/20] dt-bindings: media: imx355: Allow 2 CSI2 data
 lane output
Message-ID: <20260708-humorous-wonderful-cuttlefish-bd5ebf@quoll>
References: <20260707-media-imx355-v2-0-1683ec07b897@raspberrypi.com>
 <20260707-media-imx355-v2-2-1683ec07b897@raspberrypi.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260707-media-imx355-v2-2-1683ec07b897@raspberrypi.com>

On Tue, Jul 07, 2026 at 06:04:34PM +0100, Dave Stevenson wrote:
> The sensor supports output over either 2 or 4 CSI2 data
> lanes. The binding only permitted the 4 lane configuration.
> 
> Add the 2 lane configuration as an option.
> 
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

