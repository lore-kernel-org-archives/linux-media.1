Received: from cstnet.cn (smtp25.cstnet.cn [159.226.251.25])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 804F71DFDA1;
	Thu, 25 Jun 2026 06:10:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782367855; cv=none; b=Q1KUffhw96FpmR9LgBo5VOiBy6d1P8MTqT2iEzc7ZO/Z8+XlDMVFELx8T47oyLnnKrsnnyhlNCGAmGcPyu5OYK3G3vB32lrSOZERbwGnMswm9o2v9HwtJEJ46/U4ai2GGWxaeEOOSs9FHvb8BKyCRjQa6lRKInzydyfHVdaex3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782367855; c=relaxed/simple;
	bh=PuxQ8lnED9gKs9PpReexrJjJ6BlPP3g7im8CIZ1OoBo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Jh4+SnkGG1SR7mARH5Q5Er8XagNKouAZGSFlPB4Mue8lDmJuzrHwf2UOl1DhFwR38QBDgeRpc9Dz9rLWZgAjUGiGtYcvIyDJqIGNXm/sxHulLAIqDZtOgvrmz+K+ufkzBay2QXKpovR3iMd0jOr+62DevHW+T8f+1s6oZTr5NIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost.localdomain (unknown [111.196.245.140])
	by APP-05 (Coremail) with SMTP id zQCowAC3Gt5rxjxqZJ8oFQ--.29192S2;
	Thu, 25 Jun 2026 14:10:51 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Kees Cook <kees@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Pengpeng Hou <pengpeng@iscas.ac.cn>
Subject: [RFC] media: dib0090: stale STANDARD_* guards appear to disable delivery-system paths
Date: Thu, 25 Jun 2026 14:10:49 +0800
Message-ID: <20260625061049.22562-1-pengpeng@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:zQCowAC3Gt5rxjxqZJ8oFQ--.29192S2
X-Coremail-Antispam: 1UD129KBjvdXoWruFy7ZF1UXF4DWr1rJrykuFg_yoWDtFb_WF
	40y3WkCasrXrWkXa13G3yUZa4DWa109rn7Jry8Gw17C343ArZ3CFn0934fZrykJ3WxuFnx
	uF90qasFkw1rCjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUb4xFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_
	Gr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
	0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
	jxv20xvE14v26r126r1DMcIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr
	1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkF7I0En4kS14v26r12
	6r1DMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI
	0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y
	0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxV
	W8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1l
	IxAIcVC2z280aVCY1x0267AKxVW8Jr0_Cr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUxcTPUUU
	UU=
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/

Hi,

while auditing non-Kconfig macro worlds in drivers/media/dvb-frontends/dib0090.c,
I noticed that the file still has conditional paths using older local
CONFIG_STANDARD_* and STANDARD_* names, while nearby source uses current
CONFIG_SYS_* / SYS_* style delivery-system names.

This looks like a conditional data/control-path legality issue: if the old
STANDARD_* world is no longer reachable, register setup and calibration logic
for a delivery system can be silently compiled out even though related source
paths remain.

I am not sending a patch yet because the correct DVB policy is unclear.  The
possible repairs appear to be:

1. map the old STANDARD_* world to the current SYS_* names;
2. add an explicit current local gate if the path is still supported; or
3. delete stale support if the path is intentionally dead.

Could you advise whether those STANDARD_* branches are still intended support,
or whether they should be converted or removed?

This is static source/macro analysis only.  I have not tested tuner hardware.

Thanks,
Pengpeng

