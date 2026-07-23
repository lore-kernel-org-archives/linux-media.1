Received: from ironport.ite.com.tw (219-87-157-213.static.tfn.net.tw [219.87.157.213])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69D2E3E3D93;
	Thu, 23 Jul 2026 08:00:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=219.87.157.213
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784793652; cv=none; b=IC2rwlJHqKcFjqhVhw5xsjQX2LQtENx/qnBaSUxOBLeCPQAj8ASWXyNsvEhbXrKQ5qw6BA2gpqN0fCHy6RCz5pU8YJ18Pr4YyPSEQlGOpb+dHYlSDZu+GwBKzs0boIMQd1ApKfYBStb5ybqwqDDg795sYBLKcStzUpisDfXWjHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784793652; c=relaxed/simple;
	bh=4OioK2bKRL0KBHKI0f/E6lXIQwAat4dU35xqldb44eQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=V9x+SYi1gMuzuD/gdaufDOfBlUaA7k6NKGLJIhhe/PyWXzsGuUfCAaYf74T5GCvoIs+KK76mmllHWg19fCVJQOXZGLM7qfS3VemcG6fjRtLmhaBrSOZeKX43idlQFWV0Wj56t8ldsiT9+Q4gB/UHIIyOALa+Lg87Hc4HPKsnLgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ite.com.tw; spf=pass smtp.mailfrom=ite.com.tw; dkim=pass (2048-bit key) header.d=ite.com.tw header.i=@ite.com.tw header.b=sQ/8tBej; arc=none smtp.client-ip=219.87.157.213
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ite.com.tw
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ite.com.tw
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ite.com.tw header.i=@ite.com.tw header.b="sQ/8tBej"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=ite.com.tw; s=dkim;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=4OioK2bKRL0KBHKI0f/E6lXIQwAat4dU35xqldb44eQ=;
  b=sQ/8tBejJnwTV1tR+X11mcqk8TNM7pdcSLKnUxEWK1e7Y4e9wQ35bbNr
   JOiWbu7JYE8IOMjgQA294B9UDeyftXdPXRXI4SVN4nQxKKg6pYv7VMtGg
   O0bWxI90zbGBCP+UCCSnAmd9om3ggkgriXvav4FELCE+tIk6o8M+KWwAT
   +Vnka9phetKA4P2jRROYMLrgN5fPALH5Y8Yjpmy+qqtrEaEMCN9E59aQd
   yYw6vRAwy55E2zf+TSAttV52h2yUNFlQJQ4Wb7AUTPJmqIlLQ+ICHO2MB
   43vSu3xCbD302W9/CdqkVHlBT3u5Zw8lvA7RdVn+JCFOw1cjYc5SRFRiA
   Q==;
X-CSE-ConnectionGUID: PyPejNDlQhOqaNZrwaFD7Q==
X-CSE-MsgGUID: RiGTpqf4RfyJ71TVBkuELw==
Received: from unknown (HELO mse.ite.com.tw) ([192.168.35.30])
  by ironport.ite.com.tw with ESMTP; 23 Jul 2026 16:00:47 +0800
Received: from tpemail1.internal.ite.com.tw (TPEMAIL1.internal.ite.com.tw [192.168.15.58])
	by mse.ite.com.tw with ESMTP id 66N80faZ009581;
	Thu, 23 Jul 2026 16:00:41 +0800 (+08)
	(envelope-from Hermes.Wu@ite.com.tw)
Received: from TPEMAIL1.internal.ite.com.tw (192.168.15.58) by
 TPEMAIL1.internal.ite.com.tw (192.168.15.58) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 23 Jul 2026 16:00:40 +0800
Received: from TPEMAIL1.internal.ite.com.tw ([fe80::63c1:9095:c5a6:3291]) by
 TPEMAIL1.internal.ite.com.tw ([fe80::63c1:9095:c5a6:3291%3]) with mapi id
 15.02.2562.037; Thu, 23 Jul 2026 16:00:40 +0800
From: <Hermes.Wu@ite.com.tw>
To: <krzk@kernel.org>
CC: <mchehab@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v7 2/2] media: i2c: add driver for ITE IT6625/IT6626
Thread-Topic: [PATCH v7 2/2] media: i2c: add driver for ITE IT6625/IT6626
Thread-Index: AQHdGnK/LKn9lTMqwU+4wul6HnSTN7Z6vbWg
Date: Thu, 23 Jul 2026 08:00:39 +0000
Message-ID: <2305b1c2f5754af1a56cbcf80e951c0c@ite.com.tw>
References: <20260723-upstream-it6625-it6626-v7-0-f8175bb0ea12@ite.com.tw>
 <20260723-upstream-it6625-it6626-v7-2-f8175bb0ea12@ite.com.tw>
 <20260723-competent-poised-jaguarundi-9ea2c7@quoll>
In-Reply-To: <20260723-competent-poised-jaguarundi-9ea2c7@quoll>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-tm-snts-smtp: 30E5DF675A5C4F62EE9AA9F262D48DFC938AA39D83054CC9746D6963497E9DDC2002:8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MAIL:mse.ite.com.tw 66N80faZ009581

SGkgS3J6eXN6dG9mLA0KDQpUaGFua3MgZm9yIHRoZSByZXZpZXcuDQoNCj5PbiBUaHUsIEp1bCAy
MywgMjAyNiBhdCAxMDo0NDowM0FNICswODAwLCBIZXJtZXMgV3Ugd3JvdGU6DQo+PiArCW11dGV4
X2luaXQoJml0NjYyNS0+aXQ2NjI1X2xvY2spOw0KPj4gKwlJTklUX0RFTEFZRURfV09SSygmaXQ2
NjI1LT5ocGRfZGVsYXllZF93b3JrLCBpdDY2MjVfaHBkX2RlbGF5ZWRfd29yayk7DQo+PiArCUlO
SVRfV09SSygmaXQ2NjI1LT5wb2xsaW5nX3dvcmssIGl0NjYyNV9wb2xsaW5nX3dvcmspOw0KPj4g
Kw0KPj4gKwlpZiAoY2xpZW50LT5pcnEpIHsNCj4+ICsJCWVyciA9IGRldm1fcmVxdWVzdF90aHJl
YWRlZF9pcnEoJmNsaWVudC0+ZGV2LCBjbGllbnQtPmlycSwNCj4NCj5Zb3UgZG8gbm90IGhhdmUg
aW50ZXJydXB0cy4gUmVhZCB5b3VyIGJpbmRpbmcgYWdhaW4uIFlvdSBhcmUgbm90IGFsbG93ZWQg
dG8gc25lYWsgaW4gYW55IHVuZG9jdW1lbnRlZCBBQkkuDQoNCllvdSdyZSByaWdodC4gVGhlIGlu
dGVycnVwdCBwcm9wZXJ0eSBpcyBtaXNzaW5nIGZyb20gdGhlIGJpbmRpbmcuDQpJJ2xsIGFkZCB0
aGUgaW50ZXJydXB0IGJpbmRpbmcgaW4gdGhlIG5leHQgcmV2aXNpb24uDQoNCj4+ICsJCQkJCQlO
VUxMLCBpdDY2MjVfaXJxX2hhbmRsZXIsDQo+PiArCQkJCQkJSVJRRl9UUklHR0VSX0xPVyB8DQo+
PiArCQkJCQkJSVJRRl9PTkVTSE9UIHwNCj4+ICsJCQkJCQlJUlFGX05PX0FVVE9FTiwNCj4+ICsJ
CQkJCQkiaXQ2NjI1IiwgaXQ2NjI1KTsNCj4+ICsJCWlmIChlcnIpDQo+PiArCQkJcmV0dXJuIGVy
cjsNCj4+ICsJfSBlbHNlIHsNCj4+ICsJCWRldl9pbmZvKGl0NjYyNS0+ZGV2LCAibm8gSVJRLCBm
YWxsaW5nIGJhY2sgdG8gcG9sbGluZyIpOw0KPj4gKwkJdGltZXJfc2V0dXAoJml0NjYyNS0+dGlt
ZXIsIGl0NjYyNV9pcnFfcG9sbF90aW1lciwgMCk7DQo+PiArCX0NCj4+ICsNCj4+ICsJc2QgPSAm
aXQ2NjI1LT5zZDsNCj4+ICsJZXJyID0gaXQ2NjI1X2luaXRfdjRsMl9zdWJkZXYoaXQ2NjI1KTsN
Cj4+ICsJaWYgKGVycikNCj4+ICsJCWdvdG8gZXJyX2NsZWFuX3dvcmtfcXVldWVzOw0KPj4gKw0K
Pj4gKwllcnIgPSB2NGwyX2N0cmxfaGFuZGxlcl9zZXR1cChzZC0+Y3RybF9oYW5kbGVyKTsNCj4+
ICsJaWYgKGVycikNCj4+ICsJCWdvdG8gZXJyX2NsZWFuX2hkbDsNCj4+ICsNCj4+ICsJaXQ2NjI1
LT5jZWNfYWRhcCA9IGNlY19hbGxvY2F0ZV9hZGFwdGVyKCZpdDY2MjVfY2VjX2FkYXBfb3BzLA0K
Pj4gKwkJCQkJCWl0NjYyNSwgZGV2X25hbWUoaXQ2NjI1LT5kZXYpLA0KPj4gKwkJCQkJCUNFQ19D
QVBfREVGQVVMVFMgfA0KPj4gKwkJCQkJCUNFQ19DQVBfTU9OSVRPUl9BTEwgfA0KPj4gKwkJCQkJ
CUNFQ19DQVBfUEhZU19BRERSLA0KPj4gKwkJCQkJCUNFQ19NQVhfTE9HX0FERFJTKTsNCj4+ICsJ
aWYgKElTX0VSUihpdDY2MjUtPmNlY19hZGFwKSkgew0KPj4gKwkJZXJyID0gUFRSX0VSUihpdDY2
MjUtPmNlY19hZGFwKTsNCj4+ICsJCWRldl9lcnIoaXQ2NjI1LT5kZXYsICIlcyAlZCIsIF9fZnVu
Y19fLCBfX0xJTkVfXyk7DQo+PiArCQlnb3RvIGVycl9jbGVhbl9oZGw7DQo+PiArCX0NCj4+ICsN
Cj4+ICsJZXJyID0gY2VjX3JlZ2lzdGVyX2FkYXB0ZXIoaXQ2NjI1LT5jZWNfYWRhcCwgJmNsaWVu
dC0+ZGV2KTsNCj4+ICsJaWYgKGVyciA8IDApIHsNCj4+ICsJCWRldl9lcnIoaXQ2NjI1LT5kZXYs
ICIlczogZmFpbGVkIHRvIHJlZ2lzdGVyIHRoZSBjZWMgZGV2aWNlIiwgX19mdW5jX18pOw0KPj4g
KwkJY2VjX2RlbGV0ZV9hZGFwdGVyKGl0NjYyNS0+Y2VjX2FkYXApOw0KPj4gKwkJaXQ2NjI1LT5j
ZWNfYWRhcCA9IE5VTEw7DQo+PiArCQlnb3RvIGVycl9jbGVhbl9oZGw7DQo+PiArCX0NCj4+ICsN
Cj4+ICsJaXQ2NjI1X2RlYnVnZnNfaW5pdChpdDY2MjUsIGNsaWVudCk7DQo+PiArDQo+PiArCWl0
NjYyNV9pbml0aWFsX3NldHVwKGl0NjYyNSk7DQo+PiArCWl0NjYyNV92NGwyX3NkX2N0cmxfdXBk
YXRlKHNkKTsNCj4+ICsNCj4+ICsJZXJyID0gdjRsMl9hc3luY19yZWdpc3Rlcl9zdWJkZXYoc2Qp
Ow0KPj4gKwlpZiAoZXJyIDwgMCkgew0KPj4gKwkJZGV2X2VycihpdDY2MjUtPmRldiwgIiVzICVk
IGVycj0lZCIsIF9fZnVuY19fLCBfX0xJTkVfXywgZXJyKTsNCj4+ICsJCWdvdG8gZXJyX2NsZWFu
X2RlYnVnZnM7DQo+PiArCX0NCj4+ICsNCj4+ICsJaWYgKGNsaWVudC0+aXJxKQ0KPj4gKwkJZW5h
YmxlX2lycShjbGllbnQtPmlycSk7DQo+PiArCWVsc2UNCj4+ICsJCW1vZF90aW1lcigmaXQ2NjI1
LT50aW1lciwgamlmZmllcyArIA0KPj4gK21zZWNzX3RvX2ppZmZpZXMoUE9MTF9JTlRFUlZBTF9N
UykpOw0KPj4gKw0KPj4gKwlyZXR1cm4gMDsNCj4+ICsNCj4+ICtlcnJfY2xlYW5fZGVidWdmczoN
Cj4+ICsJZGVidWdmc19yZW1vdmVfcmVjdXJzaXZlKGl0NjYyNS0+ZGVidWdmc19kaXIpOw0KPj4g
KwljZWNfdW5yZWdpc3Rlcl9hZGFwdGVyKGl0NjYyNS0+Y2VjX2FkYXApOw0KPj4gK2Vycl9jbGVh
bl9oZGw6DQo+PiArCW1lZGlhX2VudGl0eV9jbGVhbnVwKCZzZC0+ZW50aXR5KTsNCj4+ICsJdjRs
Ml9jdHJsX2hhbmRsZXJfZnJlZSgmaXQ2NjI1LT5oZGwpOw0KPj4gKw0KPj4gK2Vycl9jbGVhbl93
b3JrX3F1ZXVlczoNCj4+ICsJaWYgKCFjbGllbnQtPmlycSkNCj4+ICsJCXRpbWVyX3NodXRkb3du
X3N5bmMoJml0NjYyNS0+dGltZXIpOw0KPj4gKwljYW5jZWxfd29ya19zeW5jKCZpdDY2MjUtPnBv
bGxpbmdfd29yayk7DQo+PiArCWNhbmNlbF9kZWxheWVkX3dvcmtfc3luYygmaXQ2NjI1LT5ocGRf
ZGVsYXllZF93b3JrKTsNCj4+ICsJbXV0ZXhfZGVzdHJveSgmaXQ2NjI1LT5pdDY2MjVfbG9jayk7
DQo+PiArCXJldHVybiBlcnI7DQo+PiArfQ0KPj4gKw0KPj4gK3N0YXRpYyB2b2lkIGl0NjYyNV9y
ZW1vdmUoc3RydWN0IGkyY19jbGllbnQgKmNsaWVudCkgew0KPj4gKwlzdHJ1Y3QgdjRsMl9zdWJk
ZXYgKnNkID0gaTJjX2dldF9jbGllbnRkYXRhKGNsaWVudCk7DQo+PiArCXN0cnVjdCBpdDY2MjUg
Kml0NjYyNSA9IHNkX3RvXzY2MjUoc2QpOw0KPj4gKw0KPj4gKwl2NGwyX2FzeW5jX3VucmVnaXN0
ZXJfc3ViZGV2KHNkKTsNCj4+ICsJdjRsMl9kZXZpY2VfdW5yZWdpc3Rlcl9zdWJkZXYoc2QpOw0K
Pj4gKw0KPj4gKwlpZiAoY2xpZW50LT5pcnEpDQo+PiArCQlkaXNhYmxlX2lycShjbGllbnQtPmly
cSk7DQo+PiArCWVsc2UNCj4+ICsJCXRpbWVyX3NodXRkb3duX3N5bmMoJml0NjYyNS0+dGltZXIp
Ow0KPj4gKw0KPj4gKwljYW5jZWxfd29ya19zeW5jKCZpdDY2MjUtPnBvbGxpbmdfd29yayk7DQo+
PiArCWNhbmNlbF9kZWxheWVkX3dvcmtfc3luYygmaXQ2NjI1LT5ocGRfZGVsYXllZF93b3JrKTsN
Cj4+ICsJZGVidWdmc19yZW1vdmVfcmVjdXJzaXZlKGl0NjYyNS0+ZGVidWdmc19kaXIpOw0KPj4g
KwljZWNfdW5yZWdpc3Rlcl9hZGFwdGVyKGl0NjYyNS0+Y2VjX2FkYXApOw0KPj4gKwltdXRleF9k
ZXN0cm95KCZpdDY2MjUtPml0NjYyNV9sb2NrKTsNCj4+ICsJbWVkaWFfZW50aXR5X2NsZWFudXAo
JnNkLT5lbnRpdHkpOw0KPj4gKwl2NGwyX2N0cmxfaGFuZGxlcl9mcmVlKCZpdDY2MjUtPmhkbCk7
DQo+PiArfQ0KPj4gKw0KPj4gK3N0YXRpYyBjb25zdCBzdHJ1Y3QgaTJjX2RldmljZV9pZCBpdDY2
MjVfaWRbXSA9IHsNCj4+ICsJeyAubmFtZSA9ICJpdDY2MjUiLCAuZHJpdmVyX2RhdGEgPSBJVDY2
MjVfQ0hJUCB9LA0KPj4gKwl7IC5uYW1lID0gIml0NjYyNiIsIC5kcml2ZXJfZGF0YSA9IElUNjYy
Nl9DSElQIH0sDQo+PiArCXt9DQo+PiArfTsNCj4+ICtNT0RVTEVfREVWSUNFX1RBQkxFKGkyYywg
aXQ2NjI1X2lkKTsNCj4+ICsNCj4+ICtzdGF0aWMgY29uc3Qgc3RydWN0IG9mX2RldmljZV9pZCBp
dDY2MjVfb2ZfbWF0Y2hbXSA9IHsNCj4+ICsJeyAuY29tcGF0aWJsZSA9ICJpdGUsaXQ2NjI1Iiwg
LmRhdGEgPSAodm9pZCAqKUlUNjYyNV9DSElQIH0sDQo+PiArCXsgLmNvbXBhdGlibGUgPSAiaXRl
LGl0NjYyNiIsIC5kYXRhID0gKHZvaWQgKilJVDY2MjZfQ0hJUCB9LA0KPg0KPg0KPkkgZG9uJ3Qg
c2VlIGFueSBkaWZmZXJlbmNlIGluIHRoZSBjb2RlIGJldHdlZW4gdGhlc2UgdHdvLCBzbyB5b3Vy
IGRldmljZXMgYXJlIHNpbXBseSBjb21wYXRpYmxlLCBubz8NCg0KVGhlIGRyaXZlciB1c2VzIHRo
ZSBjb21wYXRpYmxlIGRhdGEgdG8gZGlzdGluZ3Vpc2ggdGhlIGNoaXAgdmFyaWFudC4NCg0KVGhl
IG9ubHkgZnVuY3Rpb25hbCBkaWZmZXJlbmNlIGN1cnJlbnRseSBpcyB0aGUgQ1NJIG91dHB1dCBj
YXBhYmlsaXR5Og0KSVQ2NjI2IHN1cHBvcnRzIGJvdGggRC1QSFkgYW5kIEMtUEhZLCB3aGlsZSBJ
VDY2MjUgc3VwcG9ydHMgRC1QSFkgb25seS4NCg0KRm9yIGV4YW1wbGU6DQoNCiAgICBpZiAoZW5k
cG9pbnQuYnVzX3R5cGUgPT0gVjRMMl9NQlVTX0NTSTJfQ1BIWSAmJg0KICAgICAgICBpdDY2MjUt
PmNoaXBfdHlwZSAhPSBJVDY2MjZfQ0hJUCkNCiAgICAgICAgcmV0dXJuIC1FSU5WQUw7DQoNClNv
IHRoZSB0d28gY29tcGF0aWJsZXMgYXJlIHJlcXVpcmVkIHRvIGlkZW50aWZ5IHRoZSBoYXJkd2Fy
ZSBjYXBhYmlsaXRpZXMuDQoNCg0KPj4gKwl7fSwNCj4+ICt9Ow0KPj4gK01PRFVMRV9ERVZJQ0Vf
VEFCTEUob2YsIGl0NjYyNV9vZl9tYXRjaCk7DQo+PiArDQo+PiArc3RhdGljIHN0cnVjdCBpMmNf
ZHJpdmVyIGl0NjYyNV9kcml2ZXIgPSB7DQo+PiArCS5kcml2ZXIgPSB7DQo+PiArCQkubmFtZSA9
ICJpdDY2MjUiLA0KPj4gKwkJLm9mX21hdGNoX3RhYmxlID0gb2ZfbWF0Y2hfcHRyKGl0NjYyNV9v
Zl9tYXRjaCksDQo+DQo+RHJvcCBvZl9tYXRjaF9wdHIuIFlvdSBoYXZlIGEgd2FybmluZyBoZXJl
LCBtb3N0IGxpa2VseS4NCj4NCj5CZXN0IHJlZ2FyZHMsDQo+S3J6eXN6dG9mDQo+DQo+DQo=
