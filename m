Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A57513D1CD7
	for <linux-media@vger.kernel.org>; Wed,  5 Aug 2026 18:23:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785954215; cv=none; b=jdkOaMe443D7ZfC+Dg2Z2pt3ORMMHEjn3eRS/Ihn8o+Bo5Tjyx0uvN7fd6c/efF9+RFpzB2SVbi5lF+KTqk+pSmmbJN/TZIFL/r2pjLrecmLeNcy0dEES3r3OeKy1Y9J59uABDwDLk8dTHa3RWBjevI+m4eWAP/xr6ldHP2fSFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785954215; c=relaxed/simple;
	bh=nTc8+Tr9zgaZd4gVBmuIHYRet4AbJ/Bf3Pe+JF6wnIU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=uSCL2ZZStW0TziWHgwRoH2JcP/3NUAwfw4L4OXlReQsPElePOzl61ah59dPOMg+sjMgaMW554UIctmL2hxrUuP/1y90ftEQ2LeIRWFHzD7Pxtif1FLaXbDfkmJimZRz4JhV/ovJ0a4xI2SVAJ5LH9oOT3fK3FyEtsxM5zt0EYUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lHhUawkg; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lHhUawkg"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-39ca300db70so12775471fa.2
        for <linux-media@vger.kernel.org>; Wed, 05 Aug 2026 11:23:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785954212; x=1786559012; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=cOOcUtJpZgjZhcvvjYqKMWSAMDYUSI7q14I+SQGV0ow=;
        b=lHhUawkgbNjMs9K5/AdKn1u4MpK3/7znDFDuvbA38I+b1Bxs1mZ0qOP+6pYCC9gL4p
         Rubwl2jpbdjY44DbhuUTfIAT+wzl54ZqsoY/cUGqJqiFvDT6sVmCxKDAkx1O1PaE5J+7
         5An/V/6WWPyzNlluzImxK2Nth33qqmc3nT3KU5NLaTbpIXc1S6PaYsCvlAq8weU/bdwC
         WY731CCi2MuZBsjpRpBOpJZXA+tZnUDbJzCz8LwSIRASBJuEEEDlG1YTFJtAR8i1+LKK
         urSe8oKmIufz0vc32XQUKoNUMlHI2bwDoexbajQPDtqmJ8sSvk5v18w8wUCtaly9ESty
         kolQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785954212; x=1786559012;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=cOOcUtJpZgjZhcvvjYqKMWSAMDYUSI7q14I+SQGV0ow=;
        b=qwhRm/Qp4MTaUkkF1OfMwL1CKi4pVFgjsihiiPXvwKJ5XBZQOaO8MckorUmYP+/PMf
         lfti6nldW01tRd0sIrRGnpmTPXkWa+kcrar0EH7VNzEpT7IuyfOfi1G5gmejQweJ+qdx
         I/YwYmzntwLzZstc81cLbKEvMVQREnMN7QfsNA3T379liAdFElDsV7Lq1ohL4AV7M2Im
         a1a+z11+x4cGS6RlrSGwLtY+EFm1W9Nk+cOHKz2f7MtLtut9aecMlezU/hrWQtWiWM/4
         eTPmYOIz09LJm+wnvKa1KnYsT/UaKG8zTkOXKBS1XkvMdcI/vgV989C+4N2/Q2THnJ3H
         SWtA==
X-Forwarded-Encrypted: i=1; AHgh+Rr8bQKye+9WmwrWmx/qNSNLrUrW3L+xMn0jdDqh3GYjHLA7EECE+NTf0vGLIr4GGfocO6eEmK3sdCAXww==@vger.kernel.org
X-Gm-Message-State: AOJu0YxLHy14MMsku5DMmAi4tvaa6re30BWKK0EPBOlpdhC7Vzpg3NDW
	XOFaIN/VI6SY/63RK80pf1KNMVLdW4l2TmdNcg8aqZl9/3tev89/U7Sw
X-Gm-Gg: AR+sD12882OTtU6JSWscas0XjhKfaOrbK7gtW2yJkRJKq1tqlWtdjHcIPieg8tX8zMI
	Ft8UayD0w4LACzVp/W5u61YaDSNxeeQjzgn6vtTLxL4pDDx9K4qdfm/krkfgDC8CQkeBucTcfTC
	RkZhhQTcJFuQc1fXpMiDhfFzKlr9QtCSexKj7E6NKnvu37uSYW3jttcFpv6pjO7xPWWJOlCes9S
	Y2VMgczJxbUnQYtBNLsXRhBHG6XiWlbgbADTa/4yfbTVVaP/Md0FDfGo8x+y+iCyLjXtWlHYoLo
	VDsgJJMc/fKN1ffj4k5D/GHW0H8lPKHzeH36avFcP+NFda6ThJnusHxZl3HRw4lCokbfw7lkid7
	837/Ue/XxRdw2D5k8CHOmV6rnR8qaBvvUMLB9bHznc6jZzjg5ZXR4g6tlrjvxn3D/0F78dycLmj
	u7VaJQY33oXhz2n4VEQHiFbvJg8ANCi30DbNaKRJeYJMLkHVpIle+lLnAsaIyBgJ+KU2XC5A==
X-Received: by 2002:a05:651c:211e:b0:39b:1825:d56d with SMTP id 38308e7fff4ca-39fbb0662b3mr12618081fa.6.1785954211453;
        Wed, 05 Aug 2026 11:23:31 -0700 (PDT)
Received: from [192.168.243.250] ([94.229.19.199])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39fb9a32bb7sm11954811fa.29.2026.08.05.11.23.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 11:23:31 -0700 (PDT)
From: Nikolay Kulikov <nikolayof23@gmail.com>
Subject: [PATCH 0/4] staging: media: ipu7: abi headers cleanup
Date: Wed, 05 Aug 2026 21:23:04 +0300
Message-Id: <20260805-ipu7_abi-v1-0-46d420cef267@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXM0QpAMBTG8VfRubbaLBteRdJwxnGBNqSWdzdc/
 ur/fQE8OkIPVRLA4Ume1iVCpAn0k1lGZDREQ8YzxQsuGW2Hbk1HTOIgSqG1NbmCmG8OLV3fVd3
 89kc3Y7+/e7jvB+J31KJsAAAA
X-Change-ID: 20260803-ipu7_abi-3ed19177fa56
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Bingbu Cao <bingbu.cao@intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-staging@lists.linux.dev, Nikolay Kulikov <nikolayof23@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785954209; l=1194;
 i=nikolayof23@gmail.com; s=20260402; h=from:subject:message-id;
 bh=nTc8+Tr9zgaZd4gVBmuIHYRet4AbJ/Bf3Pe+JF6wnIU=;
 b=c4irqDJ2R8+GXAKilehgj/HdtSJ/Cp5Ys6yzdaFmPQ37mvpN73t0GhoL0xiVbl7pqAobE0PUT
 SpwqhgXNTDqC5MAbiT6TGOdtO4dn5PU+JoJCJGnaxYVjjTomLF4y1bq
X-Developer-Key: i=nikolayof23@gmail.com; a=ed25519;
 pk=2GWUU1isl5NJpkwSCQ4OG80EinZ3EUZXlrgAg6Pz5zI=

This series cleans up unused definitions of structures, enums, and
macros. Each one was identified and verified using 'git grep' across the
entire driver.
Verified by compilation.

Signed-off-by: Nikolay Kulikov <nikolayof23@gmail.com>
---
Nikolay Kulikov (4):
      staging: media: ipu7: remove unused structures from abi/ headers
      staging: media: ipu7: remove unused abi/ macros
      staging: media: ipu7: remove unused abi enums
      staging: media: ipu7: remove unnecessary "#pragma pack()" directives

 drivers/staging/media/ipu7/abi/ipu7_fw_boot_abi.h  |  86 -----
 .../staging/media/ipu7/abi/ipu7_fw_common_abi.h    |  93 -----
 .../staging/media/ipu7/abi/ipu7_fw_config_abi.h    |   3 -
 drivers/staging/media/ipu7/abi/ipu7_fw_isys_abi.h  | 183 ---------
 drivers/staging/media/ipu7/abi/ipu7_fw_msg_abi.h   | 421 ---------------------
 .../media/ipu7/abi/ipu7_fw_psys_config_abi.h       |  24 --
 .../staging/media/ipu7/abi/ipu7_fw_syscom_abi.h    |   1 -
 7 files changed, 811 deletions(-)
---
base-commit: c6eb4dc5964fdf4086b73b7f0f5dc0d595fb5cf3
change-id: 20260803-ipu7_abi-3ed19177fa56

Best regards,
--  
Nikolay Kulikov <nikolayof23@gmail.com>

