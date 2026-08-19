Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92409399889
	for <linux-media@vger.kernel.org>; Wed, 19 Aug 2026 21:41:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.161.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787175700; cv=pass; b=fSSkkPR0oU+i9R0oxpWb1NjdvUERAD8KV/3fxuvLbq9VMnnEYillaWw1nQgmzu0U0FGyZPf2EHxUNcmKpuQOvVqfeoFvX5+xdBck3bdRaYshCaQGOG3j18RrQuMcuaXgPMW6sVJ/8zTC5BF2p9VfnxwwvdVtmv8fXZLfhvcv8v4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787175700; c=relaxed/simple;
	bh=zRF25KctlM4Q5WNhaaIrw/jFuHsFhpQlaOY6X8ea/hs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uPQv0VNBOaGUkkd5FbsG1BbGqp0LxaGJ3RbIVmjS1DrHT/o1KstP753+HmqHCaLaALxZ3FTL62Dv5pIMRTY/CZkzIOunfo6/Y9wmiAzgGwTbXFZn+Qi2ZWl1Mja7WecfYNRjphgT/yyCdCVZCVfX+k9KzZ/vBG8hOdviPK+h12w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cwOpF3JL; arc=pass smtp.client-ip=209.85.161.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cwOpF3JL"
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-6b0496f4bbcso1135832eaf.0
        for <linux-media@vger.kernel.org>; Wed, 19 Aug 2026 14:41:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787175698; cv=none;
        d=google.com; s=arc-20260327;
        b=MlUXyyGRKt6MdsQRlMzqKGtdMIGuVJtiwb4IFGBqqy85hs2+UeH5cetQw9/D4ftA/Q
         vjqBgmvjKQKnYHxkR18dU4pprxuOHStMIKCH9Ts4whwz1hodi3zYW7Gjf2joswULQx+W
         wWdyKFEMdJF8AkPAQDJokWfByx5ibAq2Gv51a1+6eaGQdlN0R282+fqdF7eQGryTOkhT
         C6FAzCnr6Yn5LqDLCsh1saF8yhCbiGOesCI85nSScZFY7d3JL5NIQqKsVkR4Jh6oZTc1
         LRXzaxaiYlGA/xvfKursF8raKucNkNdQ3XqgIy6HMlixTf6AX3ebn+B2sbl43GU3UFRr
         1ZaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=NWdT9YXI866qrHvFdokypp7DEip4bgEco40i0RkpFDI=;
        fh=2nIlZEwyLGT+kyPmNOZt21/k5p4dEzKf8t82ICO+2qs=;
        b=AUPgT8+U3700QKx19YQzePdvwiknmbq6NnIdy6HPKx8JsbwhoFFresP3yW3ZWKNvRq
         O91BVmEciHZ34P0Mjmcg+vGbf6omC5wCK6kl7CMSD/svKM/VE9qQ3Lk41RQ3IK5DlmaT
         NI3mBG2JhpJhhtITYnfOCbvpC+dhRRKjhAnDXkLhSmSkuFiyJz+X3BDX42jV36OFuiC+
         CW3xQqvFgxqOxX6B1S+lcAGrotkT5u0YeARCcpV5jFt5AlXBQSjvr9U9MbQyYY+4aSHY
         shL9nfmchR9/8wYc5Cuii19iLESPNcPIb4VBe+sZl+JFUducflmwQqR/wD8XJg3xlVKx
         mA+A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787175698; x=1787780498; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NWdT9YXI866qrHvFdokypp7DEip4bgEco40i0RkpFDI=;
        b=cwOpF3JLxyFmvpgWMb50wLZ3A+Gu/4QRBbTx3LQi6gu6DPksHc1/R6xNTDv1MQgmbu
         HReuSQTBqCp+qRED5Pc7nDDNF1nJVba6wlBtTi0FQ25JPE4RYJb1CKH2uoEcCXRSJ+k2
         CxEZssAedwaFv5iuP3oTKVL/y37oYjEkJ57qGGgmIBdb7GSQuPo6WhPiJCB3LiJMchob
         qbFX2e6hEoKFzbFOpil8Kq59y9A3SxfeRnoKnii7/AhwGYVtG1rdTP2p9VksVT2fPGZ7
         tnzUj0MwZODLAdbyKAltbDRhNc5EPzDqx4k4wktMpd+xZ7NpPx+EICsN6Rc/ItCWVkOQ
         Y8ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787175698; x=1787780498;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=NWdT9YXI866qrHvFdokypp7DEip4bgEco40i0RkpFDI=;
        b=Qj7X0g2D6Z8TpCruWNcQqODhOk3XTSHNs6J4L3B6Y+ILHxlGrNmuPUIsy0ZELWL58P
         wEq9ft4Jm8pPTSGKjnr+5R2MH1MLtp+k7WTR1R5FcZGSQif+tC+WgIlCLpCxqdC4SgZI
         a3vlnQl9jMi/jEL4dRu3hM/4kqScW5yndgjdET/SrBrvLp8RCSgV1O2y9GSCFoaikI1x
         p587qMo1DQO3QdekRV5Vxd66ptns20qJbe+JryH6yCTHoUVZzhK31v8teePDOXvvdFjP
         cAW+F20Zg3Pl8PxlM1H4mm1qojC4Rzb62xoQy2Bkhp+AhXRpWB2X/SIoOPYF+NPBnDOa
         tzNg==
X-Gm-Message-State: AOJu0YzLing+RFinfK/kv5gQl9PMvpYPKuOsu825B0zCdsE/lZZ2jQZM
	/xbQQrqvlbwTlJxOfx3H2lGq1Ockv8ZIfWwq7ACYCD+WEh32RNEfPPGhWq9LPovSHhv1WEDvOm6
	eQnumYPHbuzgekf/p3+gGvSR+Eio5TCRJAoWx
X-Gm-Gg: AR+sD11o8HyKvA11X183WfC9AA8NDT1NAbQSJEzJJR4LGppvqk2jMslDxo+eSwj18QL
	jCcQTF7oSJoByv79zAf/QrgNU7wF8XWvi86myBbhl0bRoFQLf5CwcmSuaIeXKAR7csA6FsMCeJE
	DJVMeUjYaO4FDqbVTtHz6zEXT5p121tpWat69t14HdKpZkjA5LpM5Nwg4m5nepvfM8T/1rJBlcD
	rzxYw4s6bF2cgBy0Iqi+2M02adexTkti2GEaXMGpHi3b9qxxSF8rRdSRENkIVMhQgMyBwCDPkCm
	PNFn7950YmljSvZZmqyVwSL0mH6tkDd01VCTB6lu/rLohVOeL26w4+7G3zwLeNmoh1SX/TWdJEo
	=
X-Received: by 2002:a05:6820:1905:b0:6b0:1b82:89a3 with SMTP id
 006d021491bc7-6b13c32f2e9mr7702709eaf.9.1787175698158; Wed, 19 Aug 2026
 14:41:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260818105642.65381-1-devnexen@gmail.com> <20260819213459.1220894-1-devnexen@gmail.com>
In-Reply-To: <20260819213459.1220894-1-devnexen@gmail.com>
From: David CARLIER <devnexen@gmail.com>
Date: Wed, 19 Aug 2026 22:41:27 +0100
X-Gm-Features: AcwNN1X54-kyQszxPzaYAfqWAMflXp4uxKVi2hFHrZMHrZpGhpoti64uoQ3Oowk
Message-ID: <CA+XhMqwXp4VVHJuY3dmBDLjJTyzwY=B9TEvZ9mVk=1Z5fqEogw@mail.gmail.com>
Subject: Re: [PATCH v3] media: v4l2-isp: reject zero-sized parameter blocks
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, stable@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Oupsie, sent with the wrong subject prefix and without its
changelog. It has:

v3:
- reject a block whose type info entry is empty instead of skipping it,
  so an unimplemented type does not become unconstrained uAPI

Let me know if you want it resent properly labelled.

Cheers.
