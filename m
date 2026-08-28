Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 347383101B2
	for <linux-media@vger.kernel.org>; Fri, 28 Aug 2026 05:52:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787896334; cv=pass; b=ZvUi8fCoK0TU8OwFK/PSV1DI8+U8A9XFh3hjkEOfwPYSQNUTVerOSuLAd649qVDcX+cWocOk+Srd9tZaIDC5xbvTLnJbJsmzhGWkqcCt40REssIOJgN6/9d8ooCDo0qYwk0Nnj0veG38ncfBi47ep+zfCWnFmY0U5ECLLP40XcE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787896334; c=relaxed/simple;
	bh=0ZYEOp/O+ITey9Y7ZR7D2nXGA6TvESPGUO22btqlbjY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XmRH/86ufjc+s/JoFl1BA3g/eQY8Q3TRbVcW7EdwdcwYRYy3wrswxmzmfN3cwpJRPtzjGFR6b6HoxiAduPv3d6YufiHQ60B0Hlp2nJIK9dKLZjPfQqN+34eZqgaJqH9uQ1HOPxsJ9u2tfmPUxcB8JZmPixBDJU01eDWCvQK+5Dw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XRDORABx; arc=pass smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XRDORABx"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-8534d507f59so575299b3a.0
        for <linux-media@vger.kernel.org>; Thu, 27 Aug 2026 22:52:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787896332; cv=none;
        d=google.com; s=arc-20260327;
        b=LygY+RqMR6dQRX+2zs+4XNj+fWo5j5JYu0ya27RyYfXANcioEf3x6Y0JDdPeJdOnsV
         QG7s71rp4tU9zO+UdsrZSwGf1zp5OV8vV71eWNmT3h1DbKQqjGTNs2s0OJbGaXNMyOWZ
         pGrJztHKDLNwvkr55UW3qvvid82G1RJAQCNOPOzaUiBS1roCUPhWc+C7H4s2HOMn6Xbx
         vabGcq4/0nGbefFzI8ZNH/iKB7HMla7UNZ3KNAp4duZxm9FTdxtN5oH1bRT9/J5L7wT3
         6L65ImBPfj8SqfZdaaqLmGFY2Ay57q4cqDBDoA0iLY2zoTRoHoOaobnQhiRk7i1298Mz
         e8lA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=3WVmGIasWFn4hSSL+mKRJR03iqSi2SrceDpr9Pcy6Ew=;
        fh=Uyk+gSDxDTnG5ZU45FY0nTNFo9o8NjBFLajDOrweZxw=;
        b=qrq9+lBUA9uDzo6FzBxZ3p0MShXXYP2NQ8JglFMTTx3cn9qrdLFIcmd9RWprq6q74j
         RnqiWgoGWsrN27d0YRkNLPfiZYMdJzmyR5MrShDsOp9tJwAJ6evWQlhN+W3V8HfDG85Q
         hBMgsmnPvquFrn7TlqNPUIF6XZGOD6+p1On8Ypg5jWVSNVHJ8NvqwkIdbwi8TrShJpJa
         aQhcXDY0t+etqY9d1wIJx/U91/2NubvwUR1a9pcAtvL2uSkLfp9Pj9CWVYdkuV/1jI89
         prY/VsZtB+JwO5Tn2b34stWkPrgP4wHg9b5kh/Vm6oR4v2um+gKhMcu+4KtpGfALJfoO
         hzCw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787896332; x=1788501132; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3WVmGIasWFn4hSSL+mKRJR03iqSi2SrceDpr9Pcy6Ew=;
        b=XRDORABx07hFk/aT6uRoyI5XYIqcThBcxBG+lOghO1k0GAueiHzfLQpEjY3/MvTdJ/
         qfeTR74n337zUJPIE3rB/TRE3M5Z6+VTL+S0rnU6fs11q0L8aCZTqx1ditCmZ0ODL2KY
         5f7U8f7B+jfQ2TymbfP4ERILZiOXZP0LjhG+gRe3FBRJin5bEZjki+Dq/zeW/fs/UiJo
         R3FJknsDzuyIgqyLe5J/6CjDi0BDpcCwpe7X033FILYQi2aVA07zO0piZfOtSApGKRoA
         nT/PX6iAmFYuoRlagvNnTgsvdFaSDVqQepxOy7E18chWYhaf3PUNsAiGVu/zKAcAjgDL
         zgnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787896332; x=1788501132;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=3WVmGIasWFn4hSSL+mKRJR03iqSi2SrceDpr9Pcy6Ew=;
        b=dJfpm+1Fl2t13yUd09oabb8Hz8pZAYBKb1V+4ba81Yq+Uu6SzLy+ht2FwE0phn3d7+
         nO1z+wbEYgxaOG3GsHSfz1Qj0Ao7iJVZ+bEySkZOgwdDoSo0hHkyT38yZx9CM0g4wMEN
         kMpJvF5SJhGHjp329zQxiY01P3bVspGw2iJAuTZXNb+JmQpFxqEx/cbs2N8yQxGrLY1F
         n92txB2ajO+pwI4n0O6Y0Q/wvj0PbB5kmIVs/jrXdfHVhRCxsmUf2b09L1/f/49c/e79
         YHbvzSOP7QcGgxmmx8rBdQorh0VI/UCClnpdNT8CZ6G+jiX0knntji+UpQ3EBDhhKarV
         DKzQ==
X-Gm-Message-State: AFuF++mjLPZJ5RtqUe7GWnmioUlGvil6FEPnBvCYaTXKKzBlGAdoKFpO
	5zCY/MKJZBajZ9yw+NH01HykoxnCZAPVqSujw7oNZNIjNAmq1KC/vsYnPSVTsyDdj20Kn4h7Mfp
	f598/U0w6DmT9MC+rvRNkByUdBw85YVRJyS9OkMk=
X-Gm-Gg: AR+sD107EyrWuH4nCcv09qzAflU5fzfkAEm89CMALybWUS2918ZttYqmoVWAiZcFhtD
	3RQN+xgFLm5SRBMmbEoTKuJkg7kfvNQzKEqAenw9xiNfvBYEH/EycDbP1bgdlmLerOuJmjoAV6n
	dA9a6NI8oLja/oDe0oggk7BHBb5M2NOLZio4bqKpSRHmKofug0/6hj1jP/WFFR+REmwHnV3P7tg
	5iYOSiiYUOEAT2D2VM7hRJih4D6RYJ962Er54p3FsuIOcsAHpe1nlVAeWzM9LFIVRSo1FPZka8H
	9Y1V0iFjAeie9VlomvOdV28ewLnKTphAbUOJ6mkmwSyHXw==
X-Received: by 2002:a05:6a20:3c90:b0:3d2:2011:d184 with SMTP id
 adf61e73a8af0-3d2681aa109mr8347990637.14.1787896332335; Thu, 27 Aug 2026
 22:52:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260820075524.2056029-1-eagle.alexander923@gmail.com>
 <20260820075524.2056029-2-eagle.alexander923@gmail.com> <20260827-legendary-viridian-tamarin-4e56e5@quoll>
In-Reply-To: <20260827-legendary-viridian-tamarin-4e56e5@quoll>
From: Alexander Shiyan <eagle.alexander923@gmail.com>
Date: Fri, 28 Aug 2026 08:51:59 +0300
X-Gm-Features: AcwNN1Xrmf-v0fd1jUHBsQov9V95clmiFkrlORa83OAKqyTkDszVfmK1QM_KdGM
Message-ID: <CAP1tNvSg4yWHCJW6UNZ4yQv5FCjz9u5ZLpuW5Z9skkjQYbS9AA@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: media: i2c: Add onsemi AR0234 image
 sensor binding
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Hans Verkuil <hverkuil+cisco@kernel.org>, 
	Quentin Freimanis <quentin@q-lab.dev>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>
Content-Type: text/plain; charset="UTF-8"

Hello.

> On Thu, Aug 20, 2026 at 10:55:23AM +0300, Alexander Shiyan wrote:
> > Add devicetree binding for the onsemi AR0234 CMOS image sensor.
> > Signed-off-by: Alexander Shiyan <eagle.alexander923@gmail.com>
> > ---
> >  .../bindings/media/i2c/onnn,ar0234.yaml       | 121 ++++++++++++++++++
> >  1 file changed, 121 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/media/i2c/onnn,ar0234.yaml
>
> Unanswered Sashiko comments.

I do not understand this remark.
The corrections based on sashiko-bot's feedback are included in the
cover letter.
Is something wrong?

> > diff --git a/Documentation/devicetree/bindings/media/i2c/onnn,ar0234.yaml b/Documentation/devicetree/bindings/media/i2c/onnn,ar0234.yaml
...
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - onnn,ar0234cssc
> > +      - onnn,ar0234cssm
> > +      - onnn,ar0234cs
> > +    description:
> > +      The AR0234 sensor exists in two different models, a colour variant
> > +      (AR0234CSSC) and a monochrome variant (AR0234CSSM). The device exposes
> > +      the model through registers, allowing for auto-detection with a common
> > +      "onnn,ar0234cs" compatible string.
>
> So all devices are compatible? Then why compatibility is not expressed?
> What are the actual programming differences between sc, sm and "none"
> variants?

Perhaps I need to revert to the compatibility strings that were used
in version 2
(https://patchwork.kernel.org/project/linux-media/patch/20260807102847.1813059-2-eagle.alexander923@gmail.com/).

From a programming standpoint, it makes almost no difference which
sensor is used
- the only differences are in the output format and the format count.
Either way, the driver always uses the sensor model determined via
register reads.
If the specified type does not match the detected one, only a warning
will be printed.

Thanks!
