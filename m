Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CE45282F30
	for <linux-media@vger.kernel.org>; Fri,  3 Jul 2026 19:50:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783108221; cv=none; b=ATEdBmYN7T5qyEwFHe4HUh0uxNWnEP40G9F7KVuD5/nYWOKgusRdns74Lc1E0JagA2Tjm9iso25QxiJ59sPhCsaJrLpgedfqQieAbg8IAAFP1hW4Pv8uyK5vzDYSvYPnfq1F5Uqa1cEvpCK+cjD7O4/A22/2cpT1SH7is536FKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783108221; c=relaxed/simple;
	bh=unqNE8MP8lZX5bdNWaLZFUY2fN5TbzELhGKn7b2Dll0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V0wux+Ftv0Lk/JDcUVPKqN8vWPeAP8vnCwomdQBewA3NxUqgS/zzjoRz8y3LSV/3kz9AxkcjO+2dm6otzBNdq506/LJEO59/bh6iM5xLtGeU8yQv32n7MyfKwYioJwMv/rdNavsFz0cKPut87Os8vKQa+grtkrmCUwJl+kbxKKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HPs4IcAM; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HPs4IcAM"
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-8111c0c7439so6147027b3.2
        for <linux-media@vger.kernel.org>; Fri, 03 Jul 2026 12:50:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783108219; x=1783713019; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3YDyivCac2qwNApiX3s+EtwOjLvvZwzcM7r8yH4SCHI=;
        b=HPs4IcAM7hODQob901yoWImjnWrFQtVjbP4gFOLHR/ZzU/g1cbbuECOF9z2f6nweVx
         11rNedSHvGlZ9qbgLV9Iu2evYLYfA5cuXA9SnhXMlzXvjhLZjg4t+Mg8RnJJhgne7UY/
         s+eTpup8DVP9DxQd3t/1CD+3lrB1sxYuZiqGVNU0KQ5CJz+o+PJ48unCmch5AGbc/Sjv
         q2T00lDRmY9Hy/krNAxZ3hHwDnpg/eiK6JK5+m7+yng4G1Ed9CZ+HQqW2OpJtg78GypX
         bDlSJt4OfEKiSnxiofWdA/y2oqc72LO2d21PYbaoKk8TzqHg7jyo+HC2dtR9/fpHyk7d
         eQBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783108219; x=1783713019;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3YDyivCac2qwNApiX3s+EtwOjLvvZwzcM7r8yH4SCHI=;
        b=rlFn3g/1pya83ydr05qaeHagxDWEFlg7YJvW3NTsaFPXAmqn79YL9BP/sKFU6Zmw34
         9ly4zKbKuaaDEFfihg7BFsNNGvX3VgMLcqUDADI3u75sDMbFVPeOkv2VbWqvWTmZ25jq
         0D/OyPPlJWk/1lHwCOP/iGDMgl6NLQc5ZpGA+gsjUtOz4f9k/TJCfSwilScSdaan79NZ
         ZVHudjU4xq5emY2/G+T3G3OKGFSTOtDHZV6vfV6EeEcSGdxq2qfWuuR9mRkG7cYldOwM
         07Lz8SLzRSQ/aoQXHL43MZNsHQMwy82UvAoa6vaPyDq0Q2TbzERb8OXlbqqbbveUQtlB
         2LdA==
X-Forwarded-Encrypted: i=1; AHgh+Rot6/L1CYWDP8VN01cxQabsiemD6UlCtOELnVUm7GhTCBIQpMKh5DOLJbiaAtk/bfsShrY46ZwlP3HwSA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzXwyA0RMx7okyBigL/JDfA1F1Dxz7k09cCNszN+XbMSDBXEaTc
	uTNxBS2lii6zz5nEM6tjNiGW2Qtq6hIVFGX1F/uH3iahW5tL94DqW8Dp
X-Gm-Gg: AfdE7ck9NgQ0v+iX5Nr1ROt0Qt0tKYOC6kliEFnbBmZUGnecabVYt2LPkQcJJ2fB77O
	X50+EBUnin487QcNu4exoA3gScd9ogKaQ4W7vOB/+ed04F3aKqnw7VJ8wm7vkG5aE1DUNQ8v6oU
	GeERBWweQZyhlE6C7a7imHIo5qkxIpmG+7+3wkxo7VQJmIoMoPGyuiRxv3ouiEm1w0IqjH0CS5f
	nUeCHI7/NbVMu+BW8FLNHwZndzWyRR+OKF+VKAZmX5wkvNpVdJ3X0I+JRu9q1lKQwcBzF3bfYMP
	CPXn6Kwrn2UYBebsO6M2t3l8xAtf6ef5/fkaSD8b9pf4KYTv31q+LJczyd2+vq28yymhkBna6c0
	YdfttVH3RcsbkhUVOKCtNK9yOdYsY319kPJfk0EEaLoT2ovRaybbZf6Ox8PzeNIs5ndeycXt9vs
	hqOHObNhFeZ8HQ/+OMuQLtfbfZBmm0TTYoOn2U1R20T7aP/8TdAg==
X-Received: by 2002:a05:690c:45c2:b0:80c:85b6:7650 with SMTP id 00721157ae682-8173abb42cemr6694927b3.69.1783108218436;
        Fri, 03 Jul 2026 12:50:18 -0700 (PDT)
Received: from suesslenovo ([24.176.128.175])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8144b049939sm27500667b3.32.2026.07.03.12.50.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 12:50:18 -0700 (PDT)
Date: Fri, 3 Jul 2026 15:50:17 -0400
From: Justin Suess <utilityemal77@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Sean Young <sean@mess.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Maxime Ripard <mripard@kernel.org>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, Sashiko <sashiko-bot@kernel.org>
Subject: Re: [PATCH 1/4] media: dt-bindings: allwinner,sun4i-a10-ir: add A523
 compatible
Message-ID: <akgR7N1LmqEmPSLy@suesslenovo>
References: <20260702214750.3428694-1-utilityemal77@gmail.com>
 <20260702214750.3428694-2-utilityemal77@gmail.com>
 <20260703-versed-locust-of-agility-d76fda@quoll>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260703-versed-locust-of-agility-d76fda@quoll>

On Fri, Jul 03, 2026 at 12:56:00PM +0200, Krzysztof Kozlowski wrote:
> On Thu, Jul 02, 2026 at 05:47:47PM -0400, Justin Suess wrote:
> > The A523 (sun55i) contains a newer revision of the sunxi CIR receiver.
> > It is not backwards-compatible with the A31 programming model: the
> > control register has a pulse capture mode field (bits [7:6]) that
> > resets to a value which captures no pulses at all, and the sample
> > clock divider is now selectable via SPLCFG bits [1:0] instead of
> > being fixed at the old module clock / 64.
> > 
> > Since a kernel driving it as an A31 CIR receives nothing, add the
> > compatible as a standalone entry rather than under the
> > allwinner,sun6i-a31-ir fallback.
> > 
> > Signed-off-by: Justin Suess <utilityemal77@gmail.com>
> > ---
> >  .../devicetree/bindings/media/allwinner,sun4i-a10-ir.yaml        | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-ir.yaml b/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-ir.yaml
> > index 42dfe22ad5f1..06656058ce91 100644
> > --- a/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-ir.yaml
> > +++ b/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-ir.yaml
> > @@ -19,6 +19,7 @@ properties:
> >        - const: allwinner,sun4i-a10-ir
> >        - const: allwinner,sun5i-a13-ir
> >        - const: allwinner,sun6i-a31-ir
> > +      - const: allwinner,sun55i-a523-ir
> 
> I assume you are adding it in expected order that Allwinner is
> following, not just randomly at the end of any list.
>
I did it in product generation order, is that what is expected?
I know that the a523 series succeeded a31, so that's what I put for
ordering.
> Also, please change all above entries to one enum, can be the same
> commit.
> 
No problem, I'll do that for v2.  
> 
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> Best regards,
> Krzysztof
>
