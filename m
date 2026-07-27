Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A18393CEB9D;
	Mon, 27 Jul 2026 06:24:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785133485; cv=none; b=VdrkjOcWyapAn7FYW1MgGOIp2IKeyo6k8/e2I6a0W4Sz0x9LAcyIcF/uMO2AR+4tbAVye71dcaLkJAcI304Oj0lTc1YlRW5bX7rmeg5ImOmqN8wL5/YW9BeSM9rqMditw+xQvRpJk5cuPkIea/Udk7uHora+ThbPDUKnY3tY/7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785133485; c=relaxed/simple;
	bh=uj0dW1/cUOSptKugRvHnG1G86d/08F19sM+hIpNCDkY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mYtoLM8DnKNF2qHmP0kZvjc9VwwjST5fIPaxhXpXWAjj3FBDC5Jbsb7ce3uktmh15exsDaKrBFXwTW5Qk7GmHnABDFsO4D9NJcq/iIhGPWLzVhuxR+1/iIcU/mTq4Ij6gkxxyLwrdMgQ/00hMB2KI9ZmDD5LDX/dmJfPk9c4zAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JLYpDhlc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JLYpDhlc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A4201F000E9;
	Mon, 27 Jul 2026 06:24:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785133482;
	bh=uj0dW1/cUOSptKugRvHnG1G86d/08F19sM+hIpNCDkY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=JLYpDhlcK2qVtLl7HKfvmO3THxWACz5O/Os6Dg5cUPh4ETa7C1R+siuKFlY5W/2u0
	 reiyj9fIMuCnw9P+4qs7RTDXcfMuX87Pk6kxnaZ+UDVOByOkcrKLxg3eJjTLxbLFMh
	 PU2NnYXGOvuM5c25KsRqUV9aEYspeeIaQyzO5FC746tl9jfn/Ct7Vmf2V+w0c9TVa8
	 mlQGrkmGxHlyzK6ssfGXBmdG085x/GIkE4klKvr6Cp4I+g62uxSFK9EJnoySwl/bfb
	 OLxW79Id5EGPI3qm7h1sWe8neaur8gACDq9KaAMBjqzpMcAjW3YbKQxQ8D9wXJWLYS
	 1VuGgQT8BuGTw==
Date: Mon, 27 Jul 2026 08:24:38 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Zhentao Guo <zhentao.guo@amlogic.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org
Subject: Re: [PATCH v6 6/6] arm64: defconfig: Enable CONFIG_VIDEO_AMLOGIC_VDEC
Message-ID: <20260727-vivid-native-bloodhound-4c7ff6@quoll>
References: <20260724-b4-s4-vdec-upstream-v6-0-6072a7ee7428@amlogic.com>
 <20260724-b4-s4-vdec-upstream-v6-6-6072a7ee7428@amlogic.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260724-b4-s4-vdec-upstream-v6-6-6072a7ee7428@amlogic.com>

On Fri, Jul 24, 2026 at 03:04:56PM +0800, Zhentao Guo wrote:
> Enable the Amlogic V4L2 stateless video decoder driver as a module
> in the arm64 defconfig. This driver is needed for stateless video
> decoding support on Amlogic SoCs.

Which boards use it? Look at `git log` to learn how this commit should
be written.

Best regards,
Krzysztof

