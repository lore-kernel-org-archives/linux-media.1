Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F9E93009E2;
	Mon, 22 Jun 2026 12:22:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782130975; cv=none; b=Iwy0Zabd/dtmPFO62x91biLz1yEHcBCIVT3MkBZgIj9zr9cO8pyP7x8ddmPKjm/cCPIuNqyvhzskKq07eMW6A4DVgiAM0Mp26/qxY9X98KvyFsVsoEs5ngYKMH+Gx1Z+WejISsAjEM9D67B11pAkvFpiBqjI5zMAIO7p/Xa1PoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782130975; c=relaxed/simple;
	bh=0I+ohYFcwVh2zkVhRJUCYf3//PdnxIARzRrHLDrXJ08=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MpSB6BebJ1BwXHZpXmsedEFEGWTHETqcPTIh6yEFsNHVxS+oyIRv7SQ4Pfx0C+9mXZ21wQfFKyc314ednFH4la+zWiUPHv4zyh0j307xkyuy0lgPV1cZmyPw7dyWzhEO29RIPPiuTF3tTkKGsCo9vWh8rN60CWRHb7VtH6xE9Fk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B5gsmYbB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B5gsmYbB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1BD01F000E9;
	Mon, 22 Jun 2026 12:22:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782130974;
	bh=x6/k+CfbBcsKaGFN4gzva4siYcKeEJh+NJUpiIXiDPU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=B5gsmYbB3qnTpOvSbrW+LkH7MH7gjummxw0kPteL3XfLtKvq0yuSOxI+d/9eeiw39
	 rKFR7Gf/XR+RJTuxv0/3wZ8nMHgwBtX/bn4Kz3SBVlC9xhiQNqZD3K6sk3o0NNWC5j
	 j1ZYbpcPAgJ4TYWIQhHmle5kPhaxI8k8kLUbuFqQMwayfBk6ZOmNe8J2XPzkAoLJLE
	 ouQWS8weAJBdJ6rZpyk2XsVwaYZJ0RdTitt4cm/yduxZdsFI6tDin+dcROfcQVOYS7
	 WxzNqGpVyzfVKMP7REK88zEqNqvO3PgYa9nzknKeZnddmny4ftcP2MDKzvGOQ+hWGc
	 9yLfwBCugS4lQ==
Date: Mon, 22 Jun 2026 14:22:50 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>
Cc: sakari.ailus@linux.intel.com, luca.weiss@fairphone.com, 
	Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Hans Verkuil <hverkuil+cisco@kernel.org>, 
	Hans de Goede <johannes.goede@oss.qualcomm.com>, Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
	Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>, Xiaolei Wang <xiaolei.wang@windriver.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Walter Werner Schneider <contact@schnwalter.eu>, 
	Kate Hsuan <hpa@redhat.com>, Svyatoslav Ryhel <clamor95@gmail.com>, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: media: i2c: Add imx576 sensor
Message-ID: <20260622-robust-porcelain-elephant-d9ec7f@quoll>
References: <20260619125439.55311-1-himanshu.bhavani@siliconsignals.io>
 <20260619125439.55311-2-himanshu.bhavani@siliconsignals.io>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260619125439.55311-2-himanshu.bhavani@siliconsignals.io>

On Fri, Jun 19, 2026 at 06:24:31PM +0530, Himanshu Bhavani wrote:
> +    properties:
> +      endpoint:
> +        $ref: /schemas/media/video-interfaces.yaml#
> +        unevaluatedProperties: false
> +
> +        properties:
> +          data-lanes:
> +            oneOf:
> +              - items:
> +                  - const: 1
> +                  - const: 2
> +                  - const: 3
> +                  - const: 4
> +              - items:
> +                  - const: 1
> +                  - const: 2
> +        required:
> +          - data-lanes
> +          - link-frequencies

You should require endpoint here.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

