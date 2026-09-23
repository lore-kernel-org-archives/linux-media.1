Received: from mail-pj2-f7.google.com (mail-pj2-f7.google.com [74.125.227.135])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CB3723E325
	for <linux-media@vger.kernel.org>; Wed, 23 Sep 2026 01:01:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.135
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790125281; cv=none; b=ZLugluDPdu88ohnHTQHZYFlfRf0kzXPNm+DKH2YSKzZiFFrM5k8wUGmjvEsblNimprdug4ojAkKCPYx85iOfKzWmFGacDH+m8UB3G0ZvsPgc1bZv6+ZXqB/1R1MF7KtCoKmbigKvZUKro0crvfs89fvG5SopKPNq0WibDGrmDSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790125281; c=relaxed/simple;
	bh=Ds8v6KxDkR9/9Npv13Jf4GLaCKlKSgwBLsCNTjHzyMQ=;
	h=Message-ID:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Content-Type:MIME-Version; b=K49wdIB4B5xo2Q55WIjs/H99sfjP2MtFNsK43IUysMETrw/1+3+f+sHxNVTufDzD5tuWYz3rwqWeaFkszpdFlR5TeVaXRg59EGUme+oy0wMVCoOEScbi6vphazEq8cPpg2hsgYf3roBZ0e5ggjZ1OmFvwO4gfSiZn8tNVHnPgEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Cv6G//h1; arc=none smtp.client-ip=74.125.227.135
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Cv6G//h1"
Received: by mail-pj2-f7.google.com with SMTP id d9443c01a7336-2d9080b18b6so3065965ad.1
        for <linux-media@vger.kernel.org>; Tue, 22 Sep 2026 18:01:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790125279; x=1790730079; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:date:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vEyEng1MK22ReTdo9F+8MEGOd7gPeqeDoJ7WSVRsKUU=;
        b=Cv6G//h1QV8L/xIF51r3Cwle7a20GuV9xUuY5nKrGeZc5rouNe5DZXvWdCl6+yH+7I
         suvLSTHTNfDKwvUzL7HjaTiPFuioeF+cbZmfZ8MwdP/1l/53/WTa29t+h2vxy9AwKbR8
         2Z9T1f1kB1M8NzE7hvWFspyGVpJc6a7IoBOis7jeFsBOYC8QGum+82j/asVuQKLVclwv
         e9fyTnX54a/bRGA7cU4CWRw2LSZW+EWGI1lPfgLXoALfrTge/xHec0kJq0qfKCejMM+b
         MEceu2lD7qHQGE5TUrRPQP2e4CCX+P17HXjj62S7c15TjEZSoDntBueqIqLeeFf8NgGb
         nSCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790125279; x=1790730079;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vEyEng1MK22ReTdo9F+8MEGOd7gPeqeDoJ7WSVRsKUU=;
        b=SltG6R+Xv8WDVcOpcdY9yXMUdELocQmScB2L9IDhQAPia/C6NNiJN0HAbZDqC44WUz
         X9rLcnCaXeE9MSW7Eh+GBzsNZ3VSA0uhHx6tWp+oLcJwq4oTRxGw7r5ESqSmLpR2oL76
         Smcf393TiI6OYQ/c6y7F4Ay6E3tyd8eDhj8T9obEi3ZBEmPLaIEGoz9oFpxoJZwBAg0D
         eMH4mxnHxeToQtbM8FC8b8qd5djtnLMNSqEJq4o2CSCKAwT9Kau9XI8u3L/TZfEkpkjj
         d4Y6lFsr+St2dgdfRjMrD9oLY8kxrVlEo8t8i/E4OaCLhKnMbWQo64/nOpEKD1uQg4vW
         oTIA==
X-Forwarded-Encrypted: i=1; AKwUvBxLNHQBsHlgAo45oIIJQdu4ouam2Pv/H+93NW88M93rEszJ+fGPKN49ppCLobG/3cKYWJ1N9YMtr5EJjA==@vger.kernel.org
X-Gm-Message-State: AFuF++nT+AgCjBhNA7P2vhl+pxU5Y6fOUIoguGEr33L5Cf1lBOmJ3eXG
	Igy3uqbM7np9yRLn+AU1Pg3ftjcg1Dl6FhgqpQuGdVNyp494zs0vOcoH
X-Gm-Gg: AYBFou3TapIrJCj+R8ux0J+aZfCjMYx2fO/Nu17xw+3VMJ+U6z50QBmOUBK203PjV0z
	L+EJ42z63vEPyGroGW9M5GrRM/UohGscZH5bTB3auUy75e1ZXPyTIMn16W3rX+ahZfShnB/eiV+
	doTX3mITzun0CMV42qv4lIXm/MW0tWZp8pkBd43nXI6pxV6Gjh+VLnXS1ynNOaB64K9BgVgdQD6
	EydAkb4vq6qjJ3eePvpHPNzoq5/gE8mOsHnKkBO2AVtvzIx8iCejC3EQc6s5eXW2DVR9No1VYni
	j3EXuxs9dNe/mMfiCzkWFUSqF+6TY21OHEl9weZJRVwwQzuLwEpijMdUNIQFsIu6T1URvw8mmCv
	BghJhjjSOpgBpmaqsZulqeiJliZ3ncDMhffUmvyHTdrH/QlhvzI/zY8SG7gDzsEp1QYoI1MKie1
	UAJ6BUOqq2J1ys+lRks4ENkkjWXlGSElDSeui8MNSV12ZYBn7d8kPtJDxw+qMSrj4sQHyDvpbvo
	1pwsqyAcoNiS39pN2Foiyw7+KKu1TIWrnDeEvYQdPX9QP0h/QFMqrVwiqXh83k=
X-Received: by 2002:a17:902:d48a:b0:2da:f7ad:cfea with SMTP id d9443c01a7336-2df69d1aa73mr8835515ad.8.1790125279133;
        Tue, 22 Sep 2026 18:01:19 -0700 (PDT)
Received: from [127.0.1.1] ([2409:408d:3188:aa03:9728:ccb0:1ebd:8895])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df6a5f035bsm2369745ad.65.2026.09.22.18.01.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 18:01:17 -0700 (PDT)
Message-ID: <6ab324dd.577d9347.2d1fba.32e4@mx.google.com>
Date: Tue, 22 Sep 2026 18:01:17 -0700 (PDT)
From: Rohinthan P <rokinthanp03@gmail.com>
To: Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 syzbot+9f7405999979761b6cfc@syzkaller.appspotmail.com
Subject: Re: [PATCH v3] media: v4l2-ctrls: do nothing if controls[0] == NULL
 in cluster functions
In-Reply-To: <2e35f2b6-6b90-4587-8891-08846433b0d6@kernel.org>
References:
 <CAHzb5FFOq=2_piCiFdEun_s2h+Jr90pNLF5O_2umNLkM9-XjkA@mail.gmail.com>
 <2e35f2b6-6b90-4587-8891-08846433b0d6@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Hans,

Thank you for reviewing the patch!

1. Regarding my name:
   My correct name is "Rohinthan P". I have updated my email display name
   and git configuration so that Author and Signed-off-by consistently match.

2. Regarding the 'Reply-To' header:
   That was an accidental typo in my Gmail web settings where 'www.' was
   mistakenly prefixed to the address. I have fixed and removed that setting.

Please let me know if you would like me to resubmit a [PATCH v4] with the
updated Author and Signed-off-by lines, or if you can apply v3 directly
with the name "Rohinthan P <rokinthanp03@gmail.com>".

Thanks,
Rohinthan P
