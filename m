Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9E3D41A8F
	for <linux-media@vger.kernel.org>; Thu,  8 Oct 2026 00:40:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791420002; cv=none; b=DNoD5iObxk8xom6bfPqaJb7L7WMFvu9foGxd08pOiRFagv55iuoGUxDzkPZ6iVHrtrRh9NIbSHZXpxfgxVUwUVuVMEwiLCyTgRfx551N4HkkzRnpAh4P9SdZPdKE1nxqGZ/4N0k+o612elWRNw6nlvtfJ+pX7NbEnv3B9ipb/1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791420002; c=relaxed/simple;
	bh=nnpHsv974KR+KbHrvhcpvAmlfbZpED6CNOh0RB3EtF0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pYtE+UgOmjM+NXEAN4APlKNdPkbcBWiLC/AA3LgcdAn9uDPe4ZcX3wmoHMEJw4Tngz5uI2wH0Y56vyxPdJCmrr8pieh4Uh7OTTSj5XkF79pS48A3eH3TxCJuSCAWEAffbbTU94SKc2Zr7bqN98YQTP6ODPZXMbVdsQIVJjP9MQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ZO+LCwaN; arc=none smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ZO+LCwaN"
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-30b6dad2382so5535017eec.0
        for <linux-media@vger.kernel.org>; Wed, 07 Oct 2026 17:40:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1791420000; x=1792024800; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nnpHsv974KR+KbHrvhcpvAmlfbZpED6CNOh0RB3EtF0=;
        b=ZO+LCwaNmXaeAOQkJKngxppfJibM+2ZGL/qlEi4vRYhMCOF14OTmvAmBbXANxZgbhK
         RJ//iBNBdhHCdZ5HFNDIofppl5WlAvp3PnTx5ZLgaPJR5UxGzEXPssQVSaMaPgnpDhfA
         aOL0mlVUoxzg0plPJ+N35XHD5kH+x5SC+IBLM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791420000; x=1792024800;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nnpHsv974KR+KbHrvhcpvAmlfbZpED6CNOh0RB3EtF0=;
        b=WlpD/Lo5t2Ah4kvPWX6XKQD+rvhqRuLSSPlmsbEB6l1uxlLKZuJNDS978SxOLgtcEc
         Xaa/tMQNF2uWWaab/pDyAjf5YYzbue2YHx7iAc87hyU6o7DZFIm2Z57InmUR6pboAOkO
         TuEqUJxazJLz9vsVlYIwxTGH8uMSS6PUdZbZdGPDPueFlnsSuNACMzqhHGQx1zOJWog5
         6H0CULLzxBCfoDLMZ67aMrJUQpGW/jfwacvuvXkCYERZ5r8cPhNEZewpW/58tzUoydFB
         fg/gK7PMq5EWI088AaT2Ogjz7uc+Z/FTjCIl2Z0iYDd/ZrCeZnqJYq0121yb3W43ImS9
         K1Pw==
X-Gm-Message-State: AFuF++mxgkG1xWEI9amBLtNdjEy6YDTl4EGSF6uJLfCLErkExF2PVGI0
	6ejCecwTLaA9R/cVGcqwxLTq8aaIyMbx8AnCFXV2UJVLSuqunk0/LGgbzF7U1ydvMt1A/bCcW6W
	0XFE=
X-Gm-Gg: AYBFou0doZVKBXXo505IcWH7TL7yRrl+HKWgeZQWRVM/QuWfpxkalkGJCrGohsoBiq1
	IGOLHlmAdd/q7kLEjKEOiJ/6ghBOE+KoKJXX48gvAg9PrIIvHZYXpEKN0Jcf3TGHgCQK7NnSJst
	KUglJJf4n3jB6WchtC+W9aAakPo7QrzoNd8FP+NGXRJtHUw5ZgnkdWDBbg1ClGY6zMxgVvqfe6E
	nQvrOwaMXOgtFHwmlPjwDyMUih3sOwPCTjRELAtD3WSL2g5ZGWdag4Oj8Ffi/9bDcUZIhb7qCYw
	q4AavFtlKTIvdf54ziVv4bWZybfTFWtvWivXf7NBkK+GmA9KP1UYGjYt2L4g5dY5ynunUa/w4Df
	4Anz4yfgXepE8YpI9tKDek1MJG3UMPN48uYAqA+rrp4GyCsPwNFv6HB7bJTU+bIuhbhqhVv6Xnv
	C2JlMpZlKl+CZ15/IramWRREV2CInS0+oCPI5bLalNSSMocDzKGjBo63wv75VTG2vDMNxrKJCrf
	PfTiYnxfwmN+Tn/MgFk3fOaOy2p+T5z7M4E
X-Received: by 2002:a05:7301:b06:b0:351:515b:4e85 with SMTP id 5a478bee46e88-3515dd78cacmr4371886eec.16.1791419999599;
        Wed, 07 Oct 2026 17:39:59 -0700 (PDT)
Received: from localhost ([2a00:79e0:2e7c:8:639c:f79:fa32:5136])
        by smtp.gmail.com with UTF8SMTPSA id 5a478bee46e88-3515b03da93sm9278289eec.29.2026.10.07.17.39.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Oct 2026 17:39:58 -0700 (PDT)
Date: Wed, 7 Oct 2026 17:39:56 -0700
From: Brian Norris <briannorris@chromium.org>
To: linux-media@vger.kernel.org
Cc: Linux Media CI <media-ci@linuxtv.org>
Subject: Re: [00/13] PM: runtime: Convert pm_runtime_put_autosuspend() and
 friends to a void function
Message-ID: <asbmXKlACvgfzREP@google.com>
References: <20261006231900.3230373-1-briannorris@chromium.org>
 <6ac5ff76.95c05185.2f709d.b73b@mx.google.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6ac5ff76.95c05185.2f709d.b73b@mx.google.com>

On Wed, Oct 07, 2026 at 01:14:46AM -0700, Patchwork Integration wrote:
> Applying: hwrng: cctrng: Discard pm_runtime_put_autosuspend() return value
> Applying: drm: Discard pm_runtime_put_autosuspend() return values
> Applying: iio: Discard pm_runtime_put_autosuspend() return values
> Patch failed at 0003 iio: Discard pm_runtime_put_autosuspend() return values
> error: patch failed: drivers/iio/adc/rcar-gyroadc.c:199
> error: drivers/iio/adc/rcar-gyroadc.c: patch does not apply
> error: patch failed: drivers/iio/light/isl29028.c:395
> error: drivers/iio/light/isl29028.c: patch does not apply
> error: patch failed: drivers/iio/light/tsl2583.c:640
> error: drivers/iio/light/tsl2583.c: patch does not apply
> hint: Use 'git am --show-current-patch=diff' to see the failed patch
> hint: When you have resolved this problem, run "git am --continue".
> hint: If you prefer to skip this patch, run "git am --skip" instead.
> hint: To restore the original branch and stop patching, run "git am --abort".
> hint: Disable this message with "git config advice.mergeConflict false"

My bad, I was based on the linux-pm -next tree, and not proper
linux-next. On the bright side, some of these conflicts are from others
removing the return-code checks during refactoring!

I've rebased, and I'll send v2 at some point, after giving other
subsystems a bit to look (and possibly apply) other parts of the series.

Brian
