Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 656EB17BED0;
	Tue, 28 Jul 2026 14:38:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785249495; cv=pass; b=FcJxaMXEdHNcx2JfIRkKkNVOGv5FLGaQaX93x7Ove2Shg8TEN5+3QYyLRPpMxiZkj6CGpegmAZdcG7aEUt71cDQbCPtS63lBqPRJij7cn3qPErdJnO0xbmcLwoZpVfyHtSe2pKzuwzL0JdYU3YIV6qr7cbhMacK53lOd70XhZB0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785249495; c=relaxed/simple;
	bh=HY5OlHTZRrlFVFf9HWbLM+NcpQG3NfA3/cmCCUquAxs=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:From:To:
	 References:In-Reply-To; b=k/Cq+g21cjkhl/o6eQv/+1fVKhTcoMpSR79YatOlJQw1jIc1xybtL4/1oMORuEuChcRnVE43HW6rO/kRd1BJZgKItxPkjVu8P+g3gT8Y5JxKBgflIxVBkKzLBi7QZkS/Ofa6q4lYAWz4vnXP5vIkPrtJUUd7TllbjgvbDYZGjJw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ritovision.com; spf=pass smtp.mailfrom=ritovision.com; dkim=pass (1024-bit key) header.d=ritovision.com header.i=rito@ritovision.com header.b=V4y7GGlS; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ritovision.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ritovision.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ritovision.com header.i=rito@ritovision.com header.b="V4y7GGlS"
ARC-Seal: i=1; a=rsa-sha256; t=1785249476; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=HIqlBVqAKuigRfEuFMxlYLA+FRA9I4Xn2bF1DEtwtvIymTfLskz97bw6R3vALJqdrzfFJdopjw6bnhsF26ei2Odj93BUh7wMe0XDyyKpAy8I4Dc+836cxez9TNi0VmUIphB6eXPGfT1RT8/tvLa0Vs6XIR7vRCf4xJeKoe3RBao=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1785249476; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=HY5OlHTZRrlFVFf9HWbLM+NcpQG3NfA3/cmCCUquAxs=; 
	b=eBT3DW/YaG9u1/REDkZ/doEDZDkAzKYgriDsb2BCk4Yl/QgzvNcDEfA1OVKMbPJcSDDtOmNoJJBcOENQOWsNYFBMtdENoKI9yFrDT2Xo12uJxFNVMxNAT6jHUD/7GfXF+R4XnaOOUBDrlQMaLmbmbZMqj6fN/KP/E3yIHvs4hEI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ritovision.com;
	spf=pass  smtp.mailfrom=rito@ritovision.com;
	dmarc=pass header.from=<rito@ritovision.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1785249475;
	s=zmail; d=ritovision.com; i=rito@ritovision.com;
	h=Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Date:Message-Id:Message-Id:Subject:Subject:Cc:Cc:From:From:To:To:In-Reply-To:Reply-To;
	bh=HY5OlHTZRrlFVFf9HWbLM+NcpQG3NfA3/cmCCUquAxs=;
	b=V4y7GGlSNJBYnQ4zXDk7798YN6YynHLFwPmGrxuVVse3sdUz//vKlyFOzhByCnmn
	3DKchZaa9l/yp/Q7EtRdAOvu/29Unn2LZHy5Vfy4uITKRquMuOuRdPHmyMm1djGSRni
	vEvlqgcHlZAwn773gJwj2fQJ+3T58tqLTs3ORzVA=
Received: by mx.zohomail.com with SMTPS id 1785249474153443.3786739722666;
	Tue, 28 Jul 2026 07:37:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 28 Jul 2026 10:37:50 -0400
Message-Id: <DKAA4CVEV2FR.3KF7ANV4VCYP8@ritovision.com>
Subject: Re: [PATCH 0/2] docs: make tables responsive with content-aware
 column widths
Cc: "Daniel Lundberg Pedersen" <dlp@qtec.com>, "Randy Dunlap"
 <rdunlap@infradead.org>, <linux-doc@vger.kernel.org>,
 <linux-media@vger.kernel.org>
From: "Rito Rhymes" <rito@ritovision.com>
To: "Rito Rhymes" <rito@ritovision.com>, "Jonathan Corbet" <corbet@lwn.net>,
 "Mauro Carvalho Chehab" <mchehab+huawei@kernel.org>, "Hans Verkuil"
 <hverkuil+cisco@kernel.org>
X-Mailer: aerc 0.21.0
References: <20260724214249.23830-1-rito@ritovision.com>
 <87ik646lfc.fsf@trenco.lwn.net> <DK78KJA4LEAN.2H4O5BZN6H8LK@ritovision.com>
In-Reply-To: <DK78KJA4LEAN.2H4O5BZN6H8LK@ritovision.com>
X-ZohoMailClient: External

Daniel,

> I don't mind testing some stuff if you want me to

Thanks again for offering to do some testing. The series is now posted,
and I would appreciate it if you could try it against the tables that
prompted the original discussion, along with any other problematic pages
you know of.

Would you be able to take a look sometime this week? Testing feedback
before Jon reviews the series would be especially useful, if your
schedule allows.

Rito
