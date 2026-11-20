Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.142.180.65
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795206321;
	b=vqRvmlGEDihdxMf4COnv67bc7I/HGW6arfJt71GaBFUWKbL2b8YcBfh/SHiPxAmHfge9
	 R0H0a8zBePGFPky4JN6TpAZPzsFQ/8uu4+1h+bTEvUoeb2W2oUJ4ViWC3wW+y8RksCWvF
	 95LJJ7S99VwkdFZeIAmSjZcYCpm82kTLYRWf4Clmo2XWM/ldLJLqRlo6TF7HYcgDQVpke
	 GofZffUvS3MZzRCFqSBLOg4MQgM+XBBLVWvnwEFTEd5dY4Jw49ogJ8Y29au7VniZnkaZ5
	 8/uaTrYk3NlhZizmdBOzN6XRGjY4fxolhnvcQN2cggl4hE0yiaP0xC/Lt3LFEH3lqwg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795206321;
	h=DMARC-Filter:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=WYqrE9XtEkz8VgFi7BOblhXZU7DvXI7hVGykKHq0N9E=;
	b=nEr4Lx/wS0wpy85VcCVd/9NQkiaLzObiNaXdQqs44we+/WihgCcpNJ/NfD8RWOoFEKK2
	 7kCFDMhtWxEr17bULIAbwXk5qGvhsCZgb6BbuZT5a7s1R/+yXhEmw7Mh+rkZdx724s4Vq
	 AAajLuO5vDnTNN5O6K/YnEz1HNYlY/YJVNEXTHsIAnxZsGqUVJRoHo7CdoqR/dybLkSGa
	 LnQ7otJR1YrHNEw68zyoLRWdHG6as06kfL5p4/KJvUu4Y7jkoRKhmmu79uDgKMNYTQm/6
	 s+1tuS2DCy/iThPiiJD7IOFVevijpIYq8zM5XHGGuDOuFxed41YMUwgP2hTs+qsiR4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=makrotopia.org;
	spf=pass smtp.mailfrom=makrotopia.org;
	arc=none smtp.remote-ip=185.142.180.65
Received: from pidgin.makrotopia.org (pidgin.makrotopia.org [185.142.180.65])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A66B606A6D7;
	Fri, 20 Nov 2026 20:25:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7A66B606A6D7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=makrotopia.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=makrotopia.org
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256:X25519MLKEM768)
	 (Exim 4.100.1)
	(envelope-from <daniel@makrotopia.org>)
	id 1xUVAR-000000001fm-1n7k;
	Fri, 20 Nov 2026 20:25:07 +0000
Date: Fri, 20 Nov 2026 20:24:57 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: Diederik de Haas <diederik@cknow-tech.com>
Cc: Detlev Casanova <detlev.casanova@collabora.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	Michael Riesch <michael.riesch@collabora.com>,
	David Heidelberg <david@ixit.cz>,
	Christian Hewitt <christianshewitt@gmail.com>,
	Marc Zyngier <maz@kernel.org>, linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Jonas Karlman <jonas@kwiboo.se>,
	Dang Huynh <dang.huynh@mainlining.org>,
	Piotr Oniszczuk <piotr.oniszczuk@gmail.com>
Subject: Re: [PATCH v5 1/5] media: dt-bindings: rockchip: Add RK3568 Video
 Decoder bindings
Message-ID: <awCsmYYv5k9DYwbm@makrotopia.org>
References: <cover.1795191822.git.daniel@makrotopia.org>
 <70b950c4b4fefbe07fe081f780ff359ed697d37f.1795191822.git.daniel@makrotopia.org>
 <DN0BEIZ5BE77.AML9IJ2SIR9G@cknow-tech.com>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DN0BEIZ5BE77.AML9IJ2SIR9G@cknow-tech.com>

On Fri, Nov 20, 2026 at 09:19:24PM +0100, Diederik de Haas wrote:
> On Fri Nov 20, 2026 at 6:40 PM CET, Daniel Golle wrote:
> > From: Christian Hewitt <christianshewitt@gmail.com>
> >
> > The video decoder in RK356X (vdpu346) is described in the same way as
> > the one in RK3588 (vdpu381). A new compatible is added as the decoder
> > capabilities are a subset of the vdpu381 capabilities.
> >
> > Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
> > Acked-by: Rob Herring (Arm) <robh@kernel.org>
> > Tested-by: Diederik de Haas <diederik@cknow-tech.com> # PineTab2, Quartz64-A, NanoPi R5S
> > Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> > ---
> > v5: no changes
> > v4: add Tested-by from Diederik de Haas
> 
> I don't think a Tested-by tag is appropriate for a DT binding patch?

Yes, and I was planning to drop that, but then messed up...
