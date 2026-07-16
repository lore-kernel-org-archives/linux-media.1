Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F1BA41E6A5;
	Thu, 16 Jul 2026 12:33:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784205200; cv=none; b=baKFueAq2IFLkND2vv+06uAceEQOKAOX4RJtui6hW/nSEJBanhS81baSKcoprW2sJYJCnK2Eza3AZ7/I3C3SSV+dVODuBUXk7BclKFlWQPR5U6iX84KH+rH/eEZrW6xGBC809eYvfhklKMpGxA79m5qJDjoK4gjFpVlW36bW6w4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784205200; c=relaxed/simple;
	bh=W9t2FRaP5VyIaIjG21mJV3eKWzhaWTm2/omOBQLNYmg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 MIME-Version:Message-ID; b=KvcfdgSX0kK4uY7IUHBpjkdz+u7aXNtF+NI9Sfu5I0WUpXB5ZELZqwSzNA85R8ElgwS7axO4nMrQEKhA0ORKHv0U2ZJtbndn7JYojFhV8vCq8UR1OAZS4yU2PDXXjLsa3szWRzu80JTr2fOWinLimmhrphjGrTtFQuoR/5lifmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=clt2ZYqp; arc=none smtp.client-ip=117.135.210.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="clt2ZYqp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
	Message-ID; bh=W9t2FRaP5VyIaIjG21mJV3eKWzhaWTm2/omOBQLNYmg=; b=c
	lt2ZYqp9ooq6mmSwQ4lYuJYpJV8ToAaL9vADP3iTWIOe5Tgb05l1AbGggZAzbW6Z
	ELRWLDHbFzEeKYPzrRTeKjHTQ9/QiQq78YqDRQsglZpAdNVTtUqENFdkqYhpXR6n
	9owU+suz0i4nw/ECXitEzwkivsXrU9PAkufJ5pE2t8=
Received: from huanglei814$163.com ( [116.128.244.169] ) by
 ajax-webmail-wmsvr-40-126 (Coremail) ; Thu, 16 Jul 2026 20:32:47 +0800
 (CST)
Date: Thu, 16 Jul 2026 20:32:47 +0800 (CST)
From: huanglei  <huanglei814@163.com>
To: linux-media@vger.kernel.org
Cc: "Linux Media CI" <media-ci@linuxtv.org>, hverkuil+cisco@kernel.org,
	johan@kernel.org, mchehab@kernel.org, linux-kernel@vger.kernel.org
Subject: Re:Re: [v3,0/2] media: s2255: Fix firmware parsing OOB and cleanup
 coding style
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2023.4-cmXT build
 20260511(2e539873) Copyright (c) 2002-2026 www.mailtech.cn 163com
In-Reply-To: <6a587498.8e904814.3310e.980c@mx.google.com>
References: <20260716022358.161471-1-huanglei814@163.com>
 <6a587498.8e904814.3310e.980c@mx.google.com>
X-NTES-SC: AL_Qu2TBv6bukkt4SmebOkdm0cRjuc+UcGwv/ok1YBWc8wEmyfi1xkNWnhKJ0f7wP+DFBGPuzG1fzhU589DbaBbmMXLsHTvJKa69hKWRaOpuA==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <feb382c.8c2b.19f6aea4d68.Coremail.huanglei814@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:figvCgD3H3Rxz1hqnKIfAA--.50W
X-CM-SenderInfo: xkxd0wxohlmiqu6rljoofrz/xtbC0hHAt2pYz3G16QAA3k
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==

SGksCgpUaGFua3MgYSBsb3QgZm9yIHlvdXIgcmV2aWV3IGZlZWRiYWNrLiBUaGlzIHZlcnNpb24g
b2YgdGhlIHBhdGNoIHNlcmllcyBpcyBzdWJtaXR0ZWQg4oCMZnVsbHkgaW4gc3RyaWN0IGFjY29y
ZGFuY2Ugd2l0aCBtYWludGFpbmVyIHN1Z2dlc3Rpb25z4oCMOgrvu78KIFRoZSBjcml0aWNhbCBm
dW5jdGlvbmFsIGZpeCBtZWRpYTogczIyNTU6IGNoZWNrIGZpcm13YXJlIHNpemUgYmVmb3JlIHJl
YWRpbmcgdHJhaWxpbmcgbWFya2VyIGlzIHBsYWNlZCBhcyB0aGUgZmlyc3QgcGF0Y2ggaW5kZXBl
bmRlbnRseS4gSXQgcmVzb2x2ZXMgdGhlIG91dC1vZi1ib3VuZHMgcmVhZCB2dWxuZXJhYmlsaXR5
IGNvbXBsZXRlbHkgd2l0aCBubyB1bnJlbGF0ZWQgc3R5bGUgY2hhbmdlcywgd2hpY2ggaXMgdmVy
eSBjb252ZW5pZW50IGZvciBkaXJlY3Qgc3RhYmxlIGJhY2twb3J0aW5nLgogVGhlIHN1YnNlcXVl
bnQgbWVkaWE6IHMyMjU1OiBSZW5hbWUgQ2FtZWxDYXNlIGdvdG8gbGFiZWxzIHRvIHNuYWtlX2Nh
c2UgY2xlYW51cCBwYXRjaCBpcyBwbGFjZWQgb24gdG9wIG9mIHRoZSBmaXgsIGFzIGEgc2VwYXJh
dGUgcHVyZSBub24tZnVuY3Rpb25hbCBjb21taXQgdG8gdW5pZnkgYWxsIHRoZSBlcnJvciBwYXRo
IGxhYmVscyB0byBjb21wbHkgd2l0aCBrZXJuZWwgY29kaW5nIHN0eWxlLgrvu78KVGhpcyBvcmRl
cmluZyBhbmQgc3BsaXQgb2YgY29tbWl0cyBmdWxseSBmb2xsb3cgbWFpbnRhaW5lciBhZHZpY2Ug
dG8gbWFrZSB0aGUgc2VyaWVzIGVhc3kgdG8gbWVyZ2UsIHJldmlldyBhbmQgYmFja3BvcnQuIFRo
ZSBmaW5hbCBhcHBsaWVkIHN0YXRlIGhhcyBubyByZW1haW5pbmcgbm9uLXN0YW5kYXJkIENhbWVs
Q2FzZSBsYWJlbHMgYW5kIG1lZXRzIExpbnV4IGtlcm5lbCBjb2Rpbmcgc3R5bGUgcmVxdWlyZW1l
bnRzLgrvu78KRm9yIHRoZSBlYXJsaWVyIENJIENhbWVsQ2FzZSB3YXJuaW5nLCBpdCBvbmx5IGV4
aXN0cyB0ZW1wb3JhcmlseSBvbiB0aGUgZmlyc3QgaW5kZXBlbmRlbnQgZml4IHBhdGNoLCBhbmQg
dGhlIGZ1bGwgc2VyaWVzIGFmdGVyIHRoZSB0d28gcGF0Y2hlcyBhcmUgYXBwbGllZCB3aWxsIGVs
aW1pbmF0ZSBhbGwgc3VjaCBub24tc3RhbmRhcmQgbmFtaW5nLgoKCk9uIDE1LzA3LzIwMjYgMTI6
MDAsIEpvaGFuIEhvdm9sZCB3cm90ZToKPiBUaGlzIGxvb2tzIG9rLCBidXQgdGhlIGZpeCBzaG91
bGQgZ28gYmVmb3JlIHRoZSBjbGVhbnVwIChlLmcuIHRvCj4gZmFjaWxpdGF0ZSBiYWNrcG9ydGlu
ZykuCgoKQXQgMjAyNi0wNy0xNiAxMzowNToxMiwgIlBhdGNod29yayBJbnRlZ3JhdGlvbiIgPHBh
dGNod29ya0BtZWRpYS1jaS5vcmc+IHdyb3RlOgo+RGVhciBMZWkgSHVhbmc6Cj4KPlRoYW5rcyBm
b3IgeW91ciBwYXRjaGVzISBVbmZvcnR1bmF0ZWx5IHRoZSBNZWRpYSBDSSByb2JvdCBkZXRlY3Rl
ZCBzb21lCj5pc3N1ZXM6Cj4KPiMgVGVzdCBjaGVja3BhdGNoOi4vMDAwMS1tZWRpYS1zMjI1NS1j
aGVjay1maXJtd2FyZS1zaXplLWJlZm9yZS1yZWFkaW5nLXRyYWlsLnBhdGNoIGNoZWNrcGF0Y2gK
PkNIRUNLOiBBdm9pZCBDYW1lbENhc2U6IDxlcnJvckZXTUFSS0VSPgo+IzMwOiBGSUxFOiBkcml2
ZXJzL21lZGlhL3VzYi9zMjI1NS9zMjI1NWRydi5jOjIyODM6Cj4rZ290byBlcnJvckZXTUFSS0VS
Owo+Cj50b3RhbDogMCBlcnJvcnMsIDAgd2FybmluZ3MsIDEgY2hlY2tzLCAxMSBsaW5lcyBjaGVj
a2VkCj4KPgo+Cj5QbGVhc2UgZml4IHlvdXIgc2VyaWVzLCBhbmQgdXBsb2FkIGEgbmV3IHZlcnNp
b24uIElmIHlvdSBoYXZlIGEgcGF0Y2h3b3JrCj5hY2NvdW50LCBkbyBub3QgZm9yZ2V0IHRvIG1h
cmsgdGhlIGN1cnJlbnQgc2VyaWVzIGFzIFN1cGVyc2VkZWQuCj4KPkZvciBtb3JlIGRldGFpbHMs
IGNoZWNrIHRoZSBmdWxsIHJlcG9ydCBhdDoKPmh0dHBzOi8vbGludXgtbWVkaWEucGFnZXMuZnJl
ZWRlc2t0b3Aub3JnLy0vdXNlcnMvcGF0Y2h3b3JrLy0vam9icy8xMDUxMDA0OTgvYXJ0aWZhY3Rz
L3JlcG9ydC5odG0gLgo+Cj4KPgo+QmVzdCByZWdhcmRzLCBhbmQgSGFwcHkgSGFja2luZyEKPk1l
ZGlhIENJIHJvYm90IG9uIGJlaGFsZiBvZiB0aGUgbGludXgtbWVkaWEgY29tbXVuaXR5Lgo+Cj4t
LS0KPkNoZWNrIHRoZSBsYXRlc3QgcnVsZXMgZm9yIGNvbnRyaWJ1dGluZyB5b3VyIHBhdGNoZXMg
YXQ6Cj5odHRwczovL2RvY3Mua2VybmVsLm9yZy9kcml2ZXItYXBpL21lZGlhL21haW50YWluZXIt
ZW50cnktcHJvZmlsZS5odG1sCj4KPklmIHlvdSBiZWxpZXZlIHRoYXQgdGhlIENJIGlzIHdyb25n
LCBraW5kbHkgb3BlbiBhbiBpc3N1ZSBhdAo+aHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3Jn
L2xpbnV4LW1lZGlhL21lZGlhLWNpLy0vaXNzdWVzIG9yIHJlcGx5LWFsbAo+dG8gdGhpcyBtZXNz
YWdlLgo=
