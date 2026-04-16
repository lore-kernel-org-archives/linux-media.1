Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D82435BDB2;
	Thu, 16 Apr 2026 21:40:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776375629; cv=none; b=lVE4mAQoVq1F4BZ7V7O7qOoOD6iLyiAIM7AC39EGzljel+qvZcRGO5mKaUpMgwsp6PNl9gOzxgyTnfWYqN6Fu3PgimrQxYX3R1Of2XiOFM6AkBwe4YUhVWRC5ZjJjpYCJlBRCSf+tFmSyEdeqvEm3KN6j2Z0IWpo9ctSQW6y7nI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776375629; c=relaxed/simple;
	bh=iyF7ObkMll0TRm0z3Z9XUI3IBL9amlBRJpCbTap4Svs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sv8ulMXKpIzDYgiLSVJhRQPVv4h9Ms90l3dkFZCgqnjp/Sic15NW1FB0NdtEspSgGhR96TDlRwFVigIcHFxH9hHYPtJVz7q6Hd6QRCTnQspU1RZn3O5kcm5onfkI20TF/hLokfzz6VaXVY9oNYP4emtVJeVMT9S+o6tSCM/nDm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=CgQ4T7+7; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="CgQ4T7+7"
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 4FCE5B5;
	Thu, 16 Apr 2026 23:38:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1776375532;
	bh=iyF7ObkMll0TRm0z3Z9XUI3IBL9amlBRJpCbTap4Svs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CgQ4T7+7gdm7bdD82b3hYBxRFzGsoXAkxPgoGvJIVaXjiJ5iVejd9exGFNCLF70eD
	 3PBu/2a+bBxhVasugxiceRwJ61bexH/TfOQmZvEeAImW23rCf9yGOkB+9Zh1dfKjeE
	 IKlqljPp+p78SeuIyUhIKMJOjzQ+LwQ/OGpjDTfQ=
Date: Fri, 17 Apr 2026 00:40:25 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/1] dt-bindings: media: mt9m114: document common
 video device properties
Message-ID: <20260416214025.GG1824072@killaraus.ideasonboard.com>
References: <20260406081330.30362-1-clamor95@gmail.com>
 <20260406081330.30362-2-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260406081330.30362-2-clamor95@gmail.com>

On Mon, Apr 06, 2026 at 11:13:30AM +0300, Svyatoslav Ryhel wrote:
> Document common video interface device properties, such as rotation and
> orientation.
> 
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  .../devicetree/bindings/media/i2c/onnn,mt9m114.yaml          | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/onnn,mt9m114.yaml b/Documentation/devicetree/bindings/media/i2c/onnn,mt9m114.yaml
> index e896f4db2421..2b39614f5cbf 100644
> --- a/Documentation/devicetree/bindings/media/i2c/onnn,mt9m114.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/onnn,mt9m114.yaml
> @@ -15,6 +15,9 @@ description: |-
>    an I2C interface and outputs image data over a 8-bit parallel or 1-lane MIPI
>    CSI-2 connection.
>  
> +allOf:
> +  - $ref: /schemas/media/video-interface-devices.yaml#
> +
>  properties:
>    compatible:
>      enum:
> @@ -90,7 +93,7 @@ required:
>    - vaa-supply
>    - port
>  
> -additionalProperties: false
> +unevaluatedProperties: false
>  
>  examples:
>    - |

-- 
Regards,

Laurent Pinchart
