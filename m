Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.3
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795048523;
	b=zzOH21G2b1sH+Dh31A/fie+f0EfkgiQvAOUhAOFk9gqE/XTi5r+SUXAiFkw/2mrrifcq
	 GjD47gi2lXNIkR9j1nLOaWaM4YEPxnqOszPe7j3Q8GeX4SFJFzIKO0irrS+35OUjbQEg1
	 5Ml16uIsaVMpPUQG0oRpDq7fkUlYJVucIigMgFV4nUXSeU01D477yrom7hzbMPksrfrCu
	 QF8IsFxF2Qs+zk5tuLA5Hk9+6KRJ9qLPqZ/CP4DW1mdDtwXMY0566l15A29Q+19O7lsEa
	 ZJC6W5Ni2BrpfPAIBaKuMh7f0p5WVqK4EhN8cmaSpukxVVQvt3p99XUgP7pw2NPt9IA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795048523;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Message-ID:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-CM-TRANSID:
	 X-Coremail-Antispam:X-CM-SenderInfo;
	bh=QiI5ub7aeRy98UqWGVNYZtffU1Fzr+kpboKU9b4LC/Y=;
	b=mlC3eJ62fSWxmz/cABxIB+mld6UFJFcnPcTDpJ95Ohh8U6g20zZUPNBbZ+wJiLLpBuno
	 f1hP6RAgROS/2W7uDAH7/JaOdOb752D7hTri4FpZnOU7RO9y+LpiauLFkpMxcFZSuJ8Ge
	 talS9+s46hpi0sATyMLmyKHqP6r9GXX78sovmD7Uq6pGehEzUMikrJCuK2C+30p4EYSfZ
	 GDwXs8/wLv4t55lvCcSA0Ir90t6oqFQQz1QebkoUcQ6komsNcBEgvjfC4MMgDzh1yyZEB
	 nNAdOfr1kZ8Ci7d9mV7V4DpK/qRXrFPwSC+nezAIKJ8SQj99qHFRTS3wghAsM69sAmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b="pEZe8/d1";
	arc=none smtp.remote-ip=117.135.210.3
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FFCF606A320
	for <linux-media@vger.kernel.org>; Thu, 19 Nov 2026 00:35:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2FFCF606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=pEZe8/d1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:To:Message-ID:Subject:MIME-Version:
	Content-Type; bh=QiI5ub7aeRy98UqWGVNYZtffU1Fzr+kpboKU9b4LC/Y=;
	b=pEZe8/d19jJoAorCxrl/vHQ4P7MbX+xs6zkJGh5GiSDd8myqOT8kMBW2/sy2Gd
	szenx8WouNuKj2Fk/pthw4/P3uSHPQMIv+His6l6dues6yYGGuTPxEAInBB08th+
	DIengkClERft3KRe2OAyaFM1oeL38MYc/9Hg+plxJS1C8=
Received: from 7d83609cb52f (unknown [])
	by gzga-smtp-mtada-g1-2 (Coremail) with SMTP id _____wD3vxFERP5qjyuDIg--.27329S2;
	Thu, 19 Nov 2026 08:35:16 +0800 (CST)
Date: Thu, 19 Nov 2026 08:35:16 +0800 (CST)
From: lmyBizExplore02@163.com
To: linux-media@vger.kernel.org
Message-ID: <578268852.1577.1795048516509@7d83609cb52f>
Subject: The offline page support of mesinkmi-offline is very practical
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:_____wD3vxFERP5qjyuDIg--.27329S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7uryruFy8AFW5urWrJrWDJwb_yoW8Gw4DpF
	WfKw43CFyDtF4Sy3sFqw4xZ340gw1kJ3y7GFyUG345Xa1UWF92yrna9F1a9as7urs5Kr1Y
	qws0vrs8Cw15AaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07U8pndUUUUU=
X-CM-SenderInfo: xop1uxh2h01zhruhiji6rwjhhfrp/xtbC7wV8CWr+REUytgAA3O

The mesinkmi-offline project you maintain on GitHub is very practical and provides mesinkmi.online  Offline page support is provided, and the last update was in August 2025. It can be seen that you have continued to improve user experience and usability.

 I am a business cooperation specialist at Weifang Leiming Cloud Network Technology Co., Ltd. We focus on providing AI promotion support to open source developers. BizBot is an independently run promotion system that can automatically search the entire network for potential users that match your project or product, analyze their backgrounds to find the connection points, and then initiate precise communication in an automated way to help you get more people to discover and use your project.

 Many open source developers are very skilled, but they generally face the problem of difficulty in promotion - even if the project solves real problems, it is often buried due to lack of exposure. Our team has been deeply involved in the open source field for sixteen years, and won the second prize in the Xingzhi Cup National Artificial Intelligence Competition in 2025. We know that after a product is made, being known is the key step. BizBot is free and can be used directly after installation. You can find it by searching xnx3/bizbot in GitHub.

 If you think this direction is valuable, please reply and chat, and I can further explain how it can be promoted around your project.

