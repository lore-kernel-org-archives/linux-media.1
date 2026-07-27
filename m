Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 406E5366052;
	Mon, 27 Jul 2026 06:19:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785133163; cv=none; b=JmaprmOd6PtgZKEV0QvpjDAVhNMzPBejgZoDhg1BMSFcw6Ay3sncuskEaabl7vbG5xsqa+Wm55tEVXzm2xb0Ap0eJyakKkWEZY7qw1kZIIj2H2mKKQZwDx/h7SKGmVagRjXoa/boa/J5ropAkAv9/n+kNfz3jsxtBg8QuQykKg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785133163; c=relaxed/simple;
	bh=AF8FJazhmDI4TkiHMZkkpQZViMKxgUANv9Q2aDVaQNY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=vDTujAkYpwKQgi5YOxf8LtscbusBpfflMBouK3XMdc6tMGIBcdnvIT4K2cO0O11phJKYRfzs1jjuyg+usvJkpOB10c/+0XqMsLTvtRrnha/qZHEkBbURvy8phJHwjLj1I8RqFOx0bbWWLYx5K8tRt1t7J2GgEykQk8Vg/Lv/cW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YqqvAfrQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YqqvAfrQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1CEF1F00A3A;
	Mon, 27 Jul 2026 06:19:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785133161;
	bh=b2TB7eaDVQLZuVFQ4ft0QzbrxghU41QA2IJCelW9nOA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=YqqvAfrQEl/nRvhPYQia81Il23ZY0R5DWTftlpgDt7bzOWk20jA5lsxk0maDBYRLU
	 /nFhR3UT2HewQlADD62VsdjIeg0kzHUfZ2DnXcqIDcAJ1vptQBeTrzVMcyuCqOsUxh
	 E6NMr44Vhe9ZkGSEeT2TIr/F05TvwF31umWJgpMbDah8wfpyOnNnGST1h05O8tiknb
	 nnTYYgdK2EcRvKq/a6nZWLjHK/cl2JtVv3rMKvoJJZZJrqmwQBeHrwwgNhBZkMDSNe
	 maCcfWJGuYUOGXtdrL44mvNTcPzjOlXvU1vkAinoabJXcH2c3a6ABQVUA7bLK0XCh+
	 b4s45lAMB7MyA==
Date: Mon, 27 Jul 2026 08:19:17 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Hermes Wu <Hermes.wu@ite.com.tw>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 1/2] dt-bindings: media: add ITE IT6625/IT6626 HDMI
 bridge
Message-ID: <20260727-brawny-tested-puffin-febfc3@quoll>
References: <20260727-upstream-it6625-it6626-v8-0-2c3b0f9524fc@ite.com.tw>
 <20260727-upstream-it6625-it6626-v8-1-2c3b0f9524fc@ite.com.tw>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260727-upstream-it6625-it6626-v8-1-2c3b0f9524fc@ite.com.tw>

On Mon, Jul 27, 2026 at 10:28:41AM +0800, Hermes Wu wrote:
> Document the devicetree binding for the ITE IT6625/IT6626 HDMI to
> MIPI CSI-2 bridge. The device exposes two graph ports: port@0
> (MIPI0) and port@1 (MIPI1), the two selectable CSI-2 D-PHY/C-PHY
> outputs. Only port@0 is required, since a board only needs to wire up
> as many of the bridge's outputs as it actually uses.
> 
> Signed-off-by: Hermes Wu <Hermes.wu@ite.com.tw>
> ---
> Changes in v8:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

