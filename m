Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 718F640587D
	for <linux-media@vger.kernel.org>; Mon, 20 Jul 2026 11:49:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784548169; cv=none; b=jp+KUoJ8Ix3kfVXNIzhPNBmzGcWdgFejCWw6Ek8RbIC80LvNqwH6XrxxVRFa6LMATsxhlYbpWFPcdjj06wXGvGAxb/0KqaeR6CH2u67tLSLpsiw9SqxKeMavCb9My9uHe41cyc2CSqQVpHPC/9YS5ezJR5Jy0ygEbj6VuVTUK5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784548169; c=relaxed/simple;
	bh=kpQgwtqvNqqfcKxqM9LsZoSGqgZW8nCIf1+4VaTHB2c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cppUtuP/Y3/pTJUKqoNQLxtXopTBZD/2rakJzArL7czbHsTgJuh11+R+U17jajoNrdB29gjvU6WcfUWVHwkwvuFddt2tG1ocGbUWhRZuEQQsNs1SZ7KJJDvqEtVu314xOhfbPjEoupGSkK6FHAddZD8eGS6lZW/FBwY4rhKBzxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DHuoHJ5g; arc=none smtp.client-ip=209.85.210.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DHuoHJ5g"
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-7eb4d532e65so3773365a34.0
        for <linux-media@vger.kernel.org>; Mon, 20 Jul 2026 04:49:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784548166; x=1785152966; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FWzkp2Wnqm0l9stmCGpc16u0gXSQJW1RvOaJ/1MTuh8=;
        b=DHuoHJ5gX2m2cmkhFxdRAmTK68daXhmBpsQAaN83hJD/tdpiI5XM+vJMFs8MKuo3x6
         o5/JOaIaxgIfHS5Deyf1pLrbP7HMkV54G1gyFpe45frkXvlFkoyNfF77dggt95oYSwp0
         v65VkkDqHa1YVFy9gQZB6zTvLxT9R8Hl9zNElXhXFK1UmBNydNKJxtpSp05PTCmcIndN
         tQKYsZCNTqHRsbmicf4qBIjbDekeo1f9D3JnSlEJ74lrahZFsMDYG+fRwngAi7OLjCau
         /rfOSBmO+QhQbidkO+jjWpLLQyrQ6WbxSay51+ZUSZIX9g/1z3rXjyUvdGvqSdxYcsdz
         eLJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784548166; x=1785152966;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FWzkp2Wnqm0l9stmCGpc16u0gXSQJW1RvOaJ/1MTuh8=;
        b=YVkXXqdDmNxnE20PoIgWIPsFysnzbxjcI85wXv4Jox1JA7EjhuvzE73TbKAriIM2PH
         xWoVN9t95EEJTId10iUYFoDx9aM5WzDEoLb0bKQGMIYFHNIXeEz2GuhnbYOT8cG3DNsn
         +mQwN0XWLIyaueVM7oVth3sn/IJXMIVHnFcUZv9B1TOS+Vd7uIPURYRqWl1/Dx77R98t
         jlHbhcgNbmMAKsgaB0pGwESDrzThBFr+qMeeY2+Fu7W184IgzgvnslbLUiV6kCZyuzfu
         2aAQZWk01QwqtajNwZKlqnMbCT1IajGGkIjgrgCRI6vPBscguW2M0biJt+mDmaqcuoYO
         Ub4g==
X-Forwarded-Encrypted: i=1; AHgh+RrSG3sFmAtOA2GkHU8Y/izd+MadChs9h+gBhdqZ5rKZyHKGnzxmHgZZ+biRyhwmiZWV/PxcymUzs5Hehw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+NcgOSlX2QFtNbA9ucqyevxVgcJHhmS5k6Oj5MnlluVP/Pfqj
	ONyEg0NowEeptcU6bRrpCJ4PO5O2b/qIHDDIgY+1dVZLzLFM3KSP+qOwk0qEyf3FOj4=
X-Gm-Gg: AfdE7cnFauHHA9joCPks6rdqRhk9SLdDPqa/7tUDq12816KfB6G7DgmcDA3V3PR5ZQf
	eF2yqNAcBgnIUreglECr2jOHfD+vfjElbd4yiMD4a6MsnVRHCjhHxIyvOh7qZVMM5f5SVLZsfos
	86HmrkPGFtpV1w9j/Uakrae7U3D3palNQIUX3rvAFNCc1OorvHQju14B4zioEOKKF66yj8zvkJv
	TAe0AeZIsHY/SEscr7NdBfPb85He2y5cihv4EnEM/4Q6ObAivQYA2uUJS3Rlr1p4yijfHhDewKz
	HTZgwhtPBPRohgju+5PrzuRvXm0tOcMpqvAcqPDRoPwR5UnLigevtVEpdb+cROcufKnzmAP2c+9
	YpacdsCG8nBT6brbuXcabD5usqtpka5vQct/49D4k877hYZLrEO6VUPLW3DNmAkjj0PqRfA==
X-Received: by 2002:a05:6830:4412:b0:7d7:ea9f:c0f9 with SMTP id 46e09a7af769-7ed9a604debmr6712118a34.0.1784548166307;
        Mon, 20 Jul 2026 04:49:26 -0700 (PDT)
Received: from localhost ([74.80.182.90])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7edad94e86csm8007715a34.7.2026.07.20.04.49.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 04:49:25 -0700 (PDT)
Date: Mon, 20 Jul 2026 14:49:19 +0300
From: Dan Carpenter <error27@gmail.com>
To: Prajval Chaudhary <prajvalchaudhari733@gmail.com>
Cc: andy@kernel.org, hansg@kernel.org, mchehab@kernel.org,
	sakari.ailus@linux.intel.com, gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH v3] staging: media: atomisp: Remove pad_w and pad_h
 module parameters
Message-ID: <al4LPyMIZ2F5EElx@stanley.mountain>
References: <20260720112807.6348-1-prajvalchaudhari733@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260720112807.6348-1-prajvalchaudhari733@gmail.com>

On Mon, Jul 20, 2026 at 04:58:07PM +0530, Prajval Chaudhary wrote:
> Hi Andy, Dan, Hans,
> 
> Thank you for the review and catching this. 
> 
> In this v3, I have completely dropped the changes to the debug 
> parameters to keep the staging debug facilities fully intact as requested.
> 
> This patch now strictly focuses on removing the 'pad_w' and 'pad_h' 
> module parameters and converting them into internal driver constants.
> 
> Remove the 'pad_w' and 'pad_h' module parameters to prevent userspace
> from overriding internal ISP hardware padding boundaries. Convert them
> into internal driver constants instead.
> 
> This partially addresses the 'Remove unnecessary/unwanted module
> parameters' task in the driver's TODO file, while keeping the debug
> facilities intact as requested by maintainers.
> 
> Signed-off-by: Prajval Chaudhary <prajvalchaudhari733@gmail.com>
> ---

No.  The real answer requires is a bit complicated and requires
some thought.

regards,
dan carpenter

