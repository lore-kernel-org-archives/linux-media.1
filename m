Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2435397E89
	for <linux-media@vger.kernel.org>; Tue,  1 Sep 2026 22:21:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.161.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788301301; cv=pass; b=JOLHjIMgcnpsY1zVENgDb2j9w+31WSVtVpVnWKaBjt7iZyjUyE1wvPGBqYX3V5Aty/iUrJNYk7AXtsdBX/jM7yAQ+Qtgo7+h3YbOOiFHZtT6lXmFdJHTcoeQAtLyLNvLm/NNNuyk2Tqgi2sDDTDzA1nTJQbZGsHZfhDhQcYJUbI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788301301; c=relaxed/simple;
	bh=uzN6h4kPkqG6EgPNMNwQb+OlvA420TzhuXeECiWI50A=;
	h=MIME-Version:In-Reply-To:References:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Muk2EPnvfnf2tlDd+Uxug+xrMd3qSrLvWxMAstbyzWQmFam77mdh5Ij4AicyNRkWlRDRAnR9CdwNBdPu2M8YcKQyJqx2cU+DjMZucvgj+nFwwsiFmAzdKl52CngSIY/tlnufdaO0eOKmvTU/BNahjt9VN8gYN1/B88xrSGSkcDI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X3yd/61V; arc=pass smtp.client-ip=209.85.161.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X3yd/61V"
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-6b37782d003so290697eaf.0
        for <linux-media@vger.kernel.org>; Tue, 01 Sep 2026 15:21:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788301299; cv=none;
        d=google.com; s=arc-20260327;
        b=dvRrQ5LAmpg7PhA1CMPveC8zUt0u8PNtCQEVqH59y+gsE4leTq9wuhm1zSuJwVwxSk
         6paA1O+q8VoqjchTNVZ5LAjjzEwrLKEidXNl6uzRAFLKtvj86yTw/T1hphWa6CwW7Rsv
         HB6KSR8/OI4cX6WcVZoI49zrLwbuVilbLOmxHoqSqbvx0UvFUyw2qXmdyb91uDcoT00E
         G64jGZDXhqAt/BcLIv+D71YbaICeuBBQcVrm59b76lZpD5RpdbAtdh3/SiF9Vx/zb+HU
         I5k5m8930L0hU/c2GhY8A0sCCJn71NKPeMjqQCrNh4F/JWdhEr6PGiGWdyjmEk2uhaPq
         ZfyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature;
        bh=uzN6h4kPkqG6EgPNMNwQb+OlvA420TzhuXeECiWI50A=;
        fh=93fCvepcv8HZRh2aQLdzaiihFSxCWxMgLHLeaaqEOnw=;
        b=DGByvdFbdpy1nYzUppO4LzLrMjgT75TzqLj46ScXI8KBuJrr7MZA0Mek4hZ1DW8GWx
         V/hOqrh/V6fpBT4Q7iFY3zIl8SPSddm1dYQqLJRQARrAhyngPViKnIwP1aKZw7omnLk5
         zdGnc0MKw5Qd6QWUbY+st+zcABK1ZEsl8Ik9gYut3euxIyIOZjLGqGKglKqbSNLolvhA
         xKLoKrp50LHWF370rPDKt0nWzPaOaA4IZlhhxq+o0RW5suQdw5sgSNYTJQl3ynthd/Ov
         aDAzkXXljcSX7il7aEv2tBCjW6XTHYlcmT+dqPpNmsndGTAtyDeAlvA6eIraSoHDJAZX
         cEMA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788301299; x=1788906099; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=uzN6h4kPkqG6EgPNMNwQb+OlvA420TzhuXeECiWI50A=;
        b=X3yd/61Vvl8U6gtWqu6+A+k74tmkNsZLW1LBSPWQaFLBLP9F/ioT0mFTHx/Cu3PfWj
         4zxybiXwb04QbM5oqMxCrRaQYzM1OI1hxA5kT4WfZYaQqL1qYoJiOXnYnc0QfU0X7/tY
         tSaILGDYJQ/knj9bKV31OBjQ4JEqifksba8QkejuXEm1rY9vpzYhq8/gI9CrqAGVlrca
         zTVDKAMRJXlxztCFvPIDB0WO96g+fDF2pKr/lY42KMxwnVN9KVmgixIRInsnKewTk6Ck
         8UiqofkpciX7yLnxvjXUCN/fI1komOKqTuUeCT5mK/I8jSsEhfDlU7tVZLWiENedBg4R
         AKqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788301299; x=1788906099;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=uzN6h4kPkqG6EgPNMNwQb+OlvA420TzhuXeECiWI50A=;
        b=jH2SDNpe7fJqpqGsW5GXoOm4LBGvpHnDQ4Wt1cmTL07/2+dYVbrGCqHJ2DAU9/Gzl5
         F0Qa8u38s1v8Z3kCfMo3vPSDzeIoUtqy7Wy5UsvezvFhx4ugls28lIqfGkprc33bed3z
         jUv9aC+OgWn1xi/2Vg73JjsRnNV4lAjum1XnansqpEVqxWsZOHKH9RDC6JDbIzEq89HE
         6yaxCuZjkZqIhcbROffwnIiUPdL3t/hQKB55BA7ubhDnU4iXX92rfpaT/q5MdPN6SsMW
         3ttIZBnaUAXh1FM3jJ3JeSn1J0epozsVDdoShzXyZvsC0oU8ky1JlEJrihHwryz0sf+o
         DsbA==
X-Forwarded-Encrypted: i=1; AHgh+Rro/0rguGMXgzupEnjoCu4vSn7Foxgp57lX/8FY8u1K612vw/zlHH/f8WX4HemNGfxSX0eO1MylkLdiJA==@vger.kernel.org
X-Gm-Message-State: AFuF++mG2G+zndU1ZV/P+eW1QW0vVeBM/jplJbOsES0WnhRJne9y09om
	mgHfqFdXpBbBlT2Mpqoj1oDFa/6zYAwk78TSAyu/aKq0st6avV0nXIVig4AtU1Vlq10ROXXQQPO
	bnBu5rnJez5/SP4eCa8SsCMJnEGmBQ3I=
X-Gm-Gg: AR+sD11U4CdVCwe5jqYWpjBpy6TAYJEaqACLiNclKsx6sVPoLXQsGVLxi/1HCMbFGXt
	8CBPtQpsiiqm+7CFCKmFMLlqPk4DYFQPBJiQxjimpRTzNIcMvKgWuxGW3aPlSBrNYUY3YVcHVzR
	Zvmpnreye7feYVZCPZ+0cImTBTJYjZDpQEZ9b/OMLYvyALDsBQCSZdyxJTUWuJBCWq6utGOpmak
	ijJQFCvNc78SxwPS4Bbb79VNLdKeRSskYVawlUxvn/UYh/01616qhJXdFQ9JJQSmAiX3n8lCtz6
	FtwXBrZ0VW/OxV+aUWN8GQIaz7s/dANEJPJuEhqWIljBKLk7JROayDMB+q3hY9sGnVMCpt1Rc2S
	KVCiUP9kFxzZSJuJHbtZ7jYM=
X-Received: by 2002:a05:6820:1c95:b0:6b1:7251:41d5 with SMTP id
 006d021491bc7-6b47e9b10b5mr78023eaf.3.1788301298588; Tue, 01 Sep 2026
 15:21:38 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Tue, 1 Sep 2026 15:21:38 -0700
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Tue, 1 Sep 2026 15:21:38 -0700
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <932eafc6726b4e5d062a0166dc4b5e1594025fd1.1788286339.git.mauriziocasciano7@gmail.com>
References: <cover.1788286339.git.mauriziocasciano7@gmail.com> <932eafc6726b4e5d062a0166dc4b5e1594025fd1.1788286339.git.mauriziocasciano7@gmail.com>
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
Date: Tue, 1 Sep 2026 15:21:38 -0700
X-Gm-Features: AcwNN1VeCPBM8HQqPnfBAdek2MH5-OmaaKJ-LDFTDljCuYh5s49MMUrA1HfUgKw
Message-ID: <CAO7O_xjyMujSdFsj6JZL3hYhaz-1fJueJ9gVV7-Y268jZeZT0Q@mail.gmail.com>
Subject: Re: [PATCH v6 09/16] media: intel: ipu-bridge: allow sensor-specific
 link frequencies
To: mchehab@kernel.org, linux-media@vger.kernel.org
Cc: sakari.ailus@linux.intel.com, bingbu.cao@amd.com, 
	jacopo.mondi@ideasonboard.com, nicholas@rothemail.net, andy@kernel.org, 
	andriy.shevchenko@intel.com, hansg@kernel.org, gregkh@linuxfoundation.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi,

This patch is unchanged from v5 and I accidentally omitted the review
tag provided by Andy:

Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>

Andy provided the tag with the caveat that this approach still needs
to be confirmed as the right one. The review was posted at:
https://lore.kernel.org/linux-media/apa2u8qJm6IZ5N4X@ashevche-desk.local/

Please retain both the tag and its review context when applying this
patch or carrying it into a subsequent revision.

With Best Regards,
Maurizio Casciano
