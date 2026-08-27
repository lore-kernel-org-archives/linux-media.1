Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5095D29C328
	for <linux-media@vger.kernel.org>; Thu, 27 Aug 2026 05:30:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787808620; cv=none; b=K4Q9arvudi/mU/SUKDNMZZp755TuPR8tIMUdlhuun4/INobNWXiOa6ZtPBTQF3wjhMV3b77cNJL+jsUOh2MEI2nuGVd35xzuU+9D5ySn3wNeuqkxcT3VB5PzEo/shWM0cEVOzadjjgLJ8NkTqPLpdOQDenwnX7BOkkmv1SjRf7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787808620; c=relaxed/simple;
	bh=S6Rl6zBjfS0Ca1JzT051AkUrgEr/ED6h/G4rtheoPQw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FmikzvmEp71pfQZO834YNnB0WP+t/UpZmzgT1eff0G/A61HlQmaNsCixDCRa3uHbbwywKVUF0Hcv6r7eeYjkfkyqyRwmFknQliokXIQSL80avkB/O57zOPqh/ZROULb8DCpSu6Z5T8p22FU7ulYdW4MTOav8hagftSGOE3pIvKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GqGFyV//; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GqGFyV//"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-8518b3ff3e9so1276309b3a.2
        for <linux-media@vger.kernel.org>; Wed, 26 Aug 2026 22:30:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787808619; x=1788413419; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4XT4IaIglNY0yBU6DSM9OX+m1P0B6x9mKUa+wNt0cik=;
        b=GqGFyV//Yo+Y31aCZ0BkXVa8Rth27BXyDZgGlriDdUNt3zm9UVZsMIRsAm4j4UpUbj
         34nP/0/+2P/UcQrZ0A90c88oRnlVFq2HJALvgPEXEnGfzuPehgA/M2QeIQW3ZRM3+3zm
         qOT1ije3LVTJFxdzDnfz4o3ruoHg6A3sfHTPbsGjoLQcyjvcNOzbE7RraQW+56VuRw+N
         F6rRTMWafz+3uG9DAvKqRK8pQ4kknIrpBOab/bGLr090poVfFXYv3Mo2ORfpzlNWpCXx
         yWj3k+2/UzWsN49p3DIPBXJTQMm9qkmMJsoB7YCPG8s+ocDTyjSfFVchysd5501hzEFz
         VoRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787808619; x=1788413419;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4XT4IaIglNY0yBU6DSM9OX+m1P0B6x9mKUa+wNt0cik=;
        b=Q9ShT0XjQ18bmp09YOp5Hz9Wn7ToegCvtS9Bgs1jI2fK0Ax+R2EMCQTnu8hdrAan0+
         ROUc0FAQIJ0SLxApmaGkFwJmtvVWdIxKrE31RjZtODZlIqdWPCnGIlkqAG8uwLBZ6oXw
         fGwvMWqufdLCuLlAbL6B7CbvKPK0mEByx4c/7rMocakbu2cfuX2fLmD3g5MZz598bHTw
         ufJ3cxf0BB/RVQQ3q3qpGAFyCI++RKGlzWq2JM2+A62dUp7VBxUCkK3EwTgN21Q2ltXM
         O0zOrdHUh+TXXDdlOAQUQ1H1raSg0q2eBrT/uWMATQH7/vn1Jw+tfKB28HYkYJPXDwMx
         royQ==
X-Forwarded-Encrypted: i=1; AHgh+Rpyti5nHh77F7AiN62Tcitl0hCXpKhPazvVu8BohOzfZKviUycq3+z8TzVf8W/Eo1Kg2MDBrEDwwWgTwQ==@vger.kernel.org
X-Gm-Message-State: AFuF++mBGYFG5RnrepV4MTSUOXmXNKnsjYAdNuzrejhJE6YJguTXwTYd
	zsm4cbJb9sg+WEjq9eRqvJBFoEN5Nx3O+3uSfHBYFWRqix0QsC1vWV4s
X-Gm-Gg: AR+sD13F9MJGPcoEiNY/1jiSoqHNEPhvMcRAf3gN2T99MmX0eUSc6bdSKRBHWDxa3mg
	GpW0Cx7aZ5Z6nREr+oPdDtZi7UVlO7YWo7ZSLJoH6JmmBdsnv8av0y0pA/KbWCcgu4ReLTxwRzg
	IN9o8ERRDrkUmn33JUmGGrDAdZMjXsfEeobNMsdcc+VOx2SQQXBa86dIt6a4R0HBqbSbfMHBox5
	CCOyrysWP9F0EwbsrajQdi6RZeiQKXsIElY7TnKxXMohgfXCuFZa9+6Ph02IeXo4vFdhinVGoUZ
	nlOLM8ufI01BHniyToKbkZIASwgRj+DAPMX8gvshUVzJvfun+mI9UTMXOQmH+/C7/URmO4Di9e+
	BsYpeQGwnDlpkiUlrxD19BfQy6HBBcSCEg/0xNtYxk70Db3icwJrlryyj6KB0RsTdDjYLVFVT3Z
	Q1jHDFYJPj6xTfudqXnTcJU4YOhTkMFlqiLRezcmrFsm5GqAngqUEK8ALs7sn0V1Ls4g==
X-Received: by 2002:a05:6a21:4a97:b0:3d1:5c01:e6c0 with SMTP id adf61e73a8af0-3d15c01ef14mr4338564637.11.1787808618511;
        Wed, 26 Aug 2026 22:30:18 -0700 (PDT)
Received: from Default ([2409:40f4:1012:4330:756d:2890:a615:2db9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141a9035ff1sm12138693c88.11.2026.08.26.22.30.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 22:30:17 -0700 (PDT)
From: Jeffin Philip <jeffinphilip14@gmail.com>
To: gregkh@linuxfoundation.org
Cc: dwlsalmeida@gmail.com,
	jeffinphilip14@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	mchehab@kernel.org,
	stable@vger.kernel.org,
	syzbot+c7fc4794e59786f5b4dc@syzkaller.appspotmail.com
Subject: Re: [RFC PATCH] media: vidtv: fix uaf in vidtv_bridge_on_new_pkts_avail
Date: Thu, 27 Aug 2026 11:00:03 +0530
Message-ID: <20260827053004.14261-1-jeffinphilip14@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <2026082710-curse-hardwired-baaa@gregkh>
References: <2026082710-curse-hardwired-baaa@gregkh>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Thu, 27 Aug 2026 07:20:31 +0200, Greg KH wrote:

>On Thu, Aug 27, 2026 at 10:45:08AM +0530, Jeffin Philip wrote:
>> On Thu, 27 Aug 2026 06:51:21 +0200, Greg KH wrote:
>> 
>> >While "fun", this is not a normal path that users ever will hit.  See
>> >this thread where I propose tainting the kernel if you attempt to do
>> >this:
>> >	 https://lore.kernel.org/r/20260826-bind_taint-v1-0-52b05f4a965c@linuxfoundation.org
>> 
>> Thanks for the reference. The task hang is not possible
>> then. However, the UAF will be triggered anyway as we are just simulating
>> an unbind. Even if the driver's .release is called naturally, if we are
>> streaming data, it could cause the UAF, no?
>
>I'm not saying your patch is incorrect, just that using bind/unbind in a
>way to justify code changes isn't ok on it's own (we are seeing some
>crazy platform and pci driver patches being proposed because of this...)
>
>It's up to the maintainers here, just wanted to point out that this is
>NOT a normal codepath that users can ever exercise and think it's not
>going to possibly cause problem.

Understood. Thanks for the review.

Thanks,
Jeffin.
